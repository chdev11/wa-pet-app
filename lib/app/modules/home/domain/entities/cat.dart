import 'package:wa_pet_app/app/modules/home/domain/entities/pet.dart';
import 'package:wa_pet_app/app/modules/home/domain/utils/pet_sizes.dart';

class Cat extends IPet {
  Cat(
      {required String id,
      String? name,
      required String breedName,
      required String image,
      required String temperament,
      required String origin,
      required String lifeSpan,
      required PetWeight weight})
      : super(
            id: id,
            name: name,
            breedName: breedName,
            image: image,
            temperament: temperament,
            origin: origin,
            lifeSpan: lifeSpan,
            weight: weight);
}
