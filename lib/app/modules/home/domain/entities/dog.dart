import 'package:wa_pet_app/app/modules/home/domain/entities/pet.dart';

class Dog extends IPet {
  final int height;

  Dog(
      {required String id,
      required String breedName,
      required String image,
      required String temperament,
      required String origin,
      required String lifeSpan,
      required int weight,
      required this.height})
      : super(
            id: id,
            breedName: breedName,
            image: image,
            temperament: temperament,
            origin: origin,
            lifeSpan: lifeSpan,
            weight: weight);
}
