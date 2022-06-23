import 'package:wa_pet_app/app/modules/home/domain/entities/pet.dart';
import 'package:wa_pet_app/app/modules/home/utils/pet_enums.dart';
import 'package:wa_pet_app/app/modules/home/utils/pet_sizes.dart';

class Dog extends IPet {
  final int id;
  final PetHeight? height;

  Dog(
      {required this.id,
      String? name,
      String? breedName,
      String? image,
      String? temperament,
      String? origin,
      String? lifeSpan,
      PetWeight? weight,
      this.height})
      : super(
            selectionEnum: PetSelectionEnum.dog,
            name: name,
            breedName: breedName,
            image: image,
            temperament: temperament,
            origin: origin,
            lifeSpan: lifeSpan,
            weight: weight);
}
