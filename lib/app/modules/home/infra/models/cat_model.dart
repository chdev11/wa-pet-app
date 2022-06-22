import 'dart:convert';

import 'package:wa_pet_app/app/modules/home/domain/entities/cat.dart';
import 'package:wa_pet_app/app/modules/home/utils/pet_sizes.dart';

class CatModel extends Cat {
  CatModel(
      {required String id,
      String? name,
      required String breedName,
      String? image,
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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': breedName,
      'temperament': temperament,
      'origin': origin,
      'life_span': lifeSpan,
      'weight': {'imperial': weight.imperial, 'metric': weight.metric},
      'image': {'url': image}
    };
  }

  factory CatModel.fromMap(Map source) {
    return CatModel(
        id: source['id'],
        breedName: source['name'],
        image: source['image'] != null ? source['image']['url'] : null,
        temperament: source['temperament'],
        origin: source['origin'],
        lifeSpan: source['life_span'],
        weight: PetWeight(
            source['weight']['imperial'], source['weight']['metric']));
  }

  String toJson() => jsonEncode(toMap());

  factory CatModel.fromJson(String source) =>
      CatModel.fromMap(jsonDecode(source));
}
