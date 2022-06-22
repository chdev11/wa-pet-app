import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wa_pet_app/shared/utils/colors.dart';
import 'package:wa_pet_app/shared/utils/constants.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.onChanged,
    this.onSubmited,
    this.prefixIcon,
    this.prefixWidget,
    this.suffixIcon,
    this.suffixIconColor,
    this.obscureText = false,
    this.enabledColor,
    this.borderColor,
    this.minLines,
    this.maxLines,
    this.keyboardType,
    this.inputFormatters,
    this.suffixFunc,
    this.decoration,
    this.showBorder = true,
    this.suffixWidget,
    this.borderRad,
    this.readOnly = false,
    this.iconSize,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmited;
  final IconData? prefixIcon;
  final Widget? prefixWidget;
  final IconData? suffixIcon;
  final bool obscureText;
  final Color? enabledColor;
  final Color? borderColor;
  final int? minLines;
  final int? maxLines;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? suffixFunc;
  final BoxDecoration? decoration;
  final bool showBorder;
  final Widget? suffixWidget;
  final double? borderRad;
  final bool readOnly;
  final Color? suffixIconColor;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: bigPadding, vertical: smallPadding),
      child: Container(
        decoration: decoration,
        child: TextField(
          onSubmitted: onSubmited,
          readOnly: readOnly,
          controller: controller,
          onChanged: onChanged,
          obscureText: obscureText,
          minLines: minLines,
          maxLines: maxLines,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: mediumGrey),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: smallPadding * 1.5,
              vertical: smallPadding * 1.75,
            ),
            prefixIcon: prefixIcon != null || prefixWidget != null
                ? GestureDetector(
                    child: prefixWidget ??
                        Icon(
                          prefixIcon,
                          color: Theme.of(context).backgroundColor,
                        ),
                  )
                : null,
            suffixIcon: suffixIcon != null || suffixWidget != null
                ? GestureDetector(
                    child: suffixWidget ??
                        Icon(
                          suffixIcon,
                          color: suffixIconColor,
                          size: iconSize,
                        ),
                    onTap: suffixFunc,
                  )
                : null,
            labelText: labelText,
            labelStyle: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: Colors.grey.shade400),
            hintText: hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: Colors.grey.shade400),
            border: showBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(borderRad ?? smallPadding),
                    ),
                  )
                : InputBorder.none,
            focusedBorder: showBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(borderRad ?? smallPadding),
                    ),
                  )
                : InputBorder.none,
            enabledBorder: showBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(borderRad ?? smallPadding),
                    ),
                    borderSide: BorderSide(
                        color:
                            enabledColor ?? Theme.of(context).backgroundColor),
                  )
                : InputBorder.none,
          ),
        ),
      ),
    );
  }
}
