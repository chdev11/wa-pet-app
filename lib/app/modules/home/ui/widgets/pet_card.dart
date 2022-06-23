import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/dog.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/pet.dart';
import 'package:wa_pet_app/app/modules/home/ui/widgets/pet_card_title.dart';
import 'package:wa_pet_app/shared/utils/colors.dart';

class PetCard extends StatelessWidget {
  final IPet pet;

  const PetCard({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: pet is Dog
                      ? [
                          darkYellow.withOpacity(.6),
                          darkYellow,
                        ]
                      : [
                          mediumCian.withOpacity(.6),
                          mediumCian,
                        ],
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('Breed name'),
                      PetCardTitle(
                          pet: pet,
                          text: pet.breedName,
                          overrideText: 'Unknown'),
                      const SizedBox(height: 5),
                      const Text('Life Span'),
                      PetCardTitle(
                          pet: pet,
                          text: pet is Dog
                              ? pet.lifeSpan ?? 'Many years'
                              : '${pet.lifeSpan} years',
                          overrideText: 'Many years'),
                      const SizedBox(height: 5),
                      const Text('Temperament'),
                      PetCardTitle(
                          pet: pet,
                          text: pet.temperament,
                          overrideText: 'Very fun'),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: pet.image != null
                      ? Image(
                          image: NetworkImage(pet.image!),
                          fit: BoxFit.cover,
                          width: 120,
                          height: 120,
                        )
                      : Container(width: 120, height: 120, color: darkGrey),
                )
              ],
            ),
          ),
          Positioned(
              left: 5,
              top: 5,
              child: Icon(
                pet is Dog ? FontAwesomeIcons.dog : FontAwesomeIcons.cat,
                size: 25,
                color: darkGrey,
              ))
        ],
      ),
    );
  }
}
