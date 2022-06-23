import 'package:flutter/material.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/pet.dart';

class PetCardTitle extends StatelessWidget {
  final IPet pet;
  final String? text;
  final String overrideText;
  Alignment alignment;
  TextOverflow overflow;

  PetCardTitle(
      {Key? key,
      required this.pet,
      required this.text,
      required this.overrideText,
      this.alignment = Alignment.topRight,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.8,
      child: Align(
        alignment: alignment,
        child: Text(text ?? overrideText,
            style: TextStyle(
                fontWeight: FontWeight.bold, overflow: overflow, fontSize: 18)),
      ),
    );
  }
}
