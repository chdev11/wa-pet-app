import 'package:wa_pet_app/app/modules/home/utils/pet_sizes.dart';

abstract class IPet {
  final String? name;
  final String breedName;
  final String? image;
  final String temperament;
  final String origin;
  final String lifeSpan;
  final PetWeight weight;

  IPet(
      {this.name,
      required this.breedName,
      this.image,
      required this.temperament,
      required this.origin,
      required this.lifeSpan,
      required this.weight});
}
