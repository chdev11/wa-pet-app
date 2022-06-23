import 'package:flutter/material.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/pet.dart';

class PetCardTitle extends StatelessWidget {
  final IPet pet;
  final String? text;
  final String overrideText;

  const PetCardTitle(
      {Key? key,
      required this.pet,
      required this.text,
      required this.overrideText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.8,
      child: Align(
        alignment: Alignment.topRight,
        child: Text(text ?? overrideText,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                fontSize: 18)),
      ),
    );
  }
}
