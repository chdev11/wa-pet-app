import 'dart:convert';

import 'package:wa_pet_app/app/modules/home/domain/entities/dog.dart';
import 'package:wa_pet_app/app/modules/home/domain/utils/pet_sizes.dart';

class DogModel extends Dog {
  DogModel(
      {required String id,
      String? name,
      required String breedName,
      required String image,
      required String temperament,
      required String origin,
      required String lifeSpan,
      required PetWeight weight,
      required PetHeight height})
      : super(
            id: id,
            name: name,
            breedName: breedName,
            image: image,
            temperament: temperament,
            origin: origin,
            lifeSpan: lifeSpan,
            weight: weight,
            height: height);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': breedName,
      'temperament': temperament,
      'origin': origin,
      'life_span': lifeSpan,
      'weight': {'imperial': weight.imperial, 'metric': weight.metric},
      'height': {'imperial': height.imperial, 'metric': height.metric},
      'image': {'url': image}
    };
  }

  factory DogModel.fromMap(Map source) {
    return DogModel(
        id: source['id'],
        breedName: source['name'],
        image: source['image']['url'],
        temperament: source['temperament'],
        origin: source['origin'],
        lifeSpan: source['life_span'],
        weight:
            PetWeight(source['weight']['imperial'], source['weight']['metric']),
        height: PetHeight(
            source['height']['imperial'], source['height']['metric']));
  }

  String toJson() => jsonEncode(toMap());

  factory DogModel.fromJson(String source) =>
      DogModel.fromMap(jsonDecode(source));
}
