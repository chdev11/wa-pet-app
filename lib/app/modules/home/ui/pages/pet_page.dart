import 'package:flutter/material.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/cat.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/dog.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/pet.dart';
import 'package:wa_pet_app/app/modules/home/ui/widgets/pet_card_title.dart';
import 'package:wa_pet_app/shared/utils/colors.dart';

class PetPage extends StatefulWidget {
  final IPet pet;

  const PetPage({Key? key, required this.pet}) : super(key: key);

  @override
  State<PetPage> createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          title: Text(
            widget.pet.breedName!,
            style: const TextStyle(color: Colors.black),
          ),
          backgroundColor: widget.pet is Dog ? darkYellow : mediumCian,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(widget.pet.image ?? ''),
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.fill,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: [
                    const Text('Breed name'),
                    PetCardTitle(
                      pet: widget.pet,
                      text: widget.pet.breedName,
                      overrideText: 'Unknown',
                      alignment: Alignment.topLeft,
                    ),
                    const SizedBox(height: 5),
                    const Text('Type'),
                    PetCardTitle(
                      pet: widget.pet,
                      text: widget.pet.selectionEnum.name,
                      overrideText: 'Unknown',
                      alignment: Alignment.topLeft,
                      overflow: TextOverflow.fade,
                    ),
                    const SizedBox(height: 5),
                    const Text('Life Span'),
                    PetCardTitle(
                      pet: widget.pet,
                      text: widget.pet is Dog
                          ? widget.pet.lifeSpan ?? 'Many years'
                          : '${widget.pet.lifeSpan} years',
                      overrideText: 'Unknown',
                      alignment: Alignment.topLeft,
                    ),
                    const SizedBox(height: 5),
                    const Text('Origin'),
                    PetCardTitle(
                      pet: widget.pet,
                      text: widget.pet.origin,
                      overrideText: 'Unknown',
                      alignment: Alignment.topLeft,
                    ),
                    const SizedBox(height: 5),
                    const Text('Temperament'),
                    PetCardTitle(
                      pet: widget.pet,
                      text: widget.pet.temperament,
                      overrideText: 'Unknown',
                      alignment: Alignment.topLeft,
                      overflow: TextOverflow.fade,
                    ),
                    const SizedBox(height: 5),
                    const Text('Description'),
                    PetCardTitle(
                      pet: widget.pet,
                      text: widget.pet is Cat
                          ? (widget.pet as Cat).description ?? '?'
                          : '?',
                      overrideText: 'Unknown',
                      alignment: Alignment.topLeft,
                      overflow: TextOverflow.fade,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
