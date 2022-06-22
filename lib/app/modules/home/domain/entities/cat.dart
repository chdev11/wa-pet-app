import 'package:wa_pet_app/app/modules/home/domain/entities/pet.dart';
import 'package:wa_pet_app/app/modules/home/utils/pet_sizes.dart';

class Cat extends IPet {
  final String id;

  Cat(
      {required this.id,
      String? name,
      String? breedName,
      String? image,
      String? temperament,
      String? origin,
      String? lifeSpan,
      PetWeight? weight})
      : super(
            name: name,
            breedName: breedName,
            image: image,
            temperament: temperament,
            origin: origin,
            lifeSpan: lifeSpan,
            weight: weight);
}
