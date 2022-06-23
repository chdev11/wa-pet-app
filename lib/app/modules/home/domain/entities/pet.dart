import 'package:wa_pet_app/app/modules/home/utils/pet_enums.dart';
import 'package:wa_pet_app/app/modules/home/utils/pet_sizes.dart';

abstract class IPet {
  final PetSelectionEnum selectionEnum;
  final String? name;
  final String? breedName;
  final String? image;
  final String? temperament;
  final String? origin;
  final String? lifeSpan;
  final PetWeight? weight;

  IPet(
      {required this.selectionEnum,
      this.name,
      this.breedName,
      this.image,
      this.temperament,
      this.origin,
      this.lifeSpan,
      this.weight});
}
