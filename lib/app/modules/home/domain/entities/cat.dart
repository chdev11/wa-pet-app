import 'package:wa_pet_app/app/modules/home/domain/entities/pet.dart';

class Cat extends IPet {
  Cat(
      {required String id,
      required String breedName,
      required String image,
      required String temperament,
      required String origin,
      required String lifeSpan,
      required int weight})
      : super(
            id: id,
            breedName: breedName,
            image: image,
            temperament: temperament,
            origin: origin,
            lifeSpan: lifeSpan,
            weight: weight);
}
