import 'package:flutter/material.dart';
import 'package:wa_pet_app/shared/utils/constants.dart';

class CustomButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final IconData? icon;
  final double? padding;
  final MaterialStateProperty<Color>? color;
  final double? height;

  const CustomButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.padding,
    this.color,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding ?? bigPadding),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: color ??
              MaterialStateProperty.all(Theme.of(context).backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(smallPadding)),
          ),
        ),
        child: SizedBox(
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                  ? Icon(
                      icon,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.all(smallPadding * 0.66),
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Theme.of(context).scaffoldBackgroundColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
