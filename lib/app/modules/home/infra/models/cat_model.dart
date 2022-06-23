import 'dart:convert';

import 'package:wa_pet_app/app/modules/home/domain/entities/cat.dart';
import 'package:wa_pet_app/app/modules/home/utils/pet_sizes.dart';

class CatModel extends Cat {
  CatModel(
      {required String id,
      String? name,
      String? description,
      String? breedName,
      String? image,
      String? temperament,
      String? origin,
      String? lifeSpan,
      PetWeight? weight})
      : super(
            id: id,
            name: name,
            description: description,
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
      'description': description,
      'temperament': temperament,
      'origin': origin,
      'life_span': lifeSpan,
      'weight': weight != null
          ? {'imperial': weight!.imperial, 'metric': weight!.metric ?? ''}
          : '',
      'image': {'url': image}
    };
  }

  factory CatModel.fromMap(Map source) {
    return CatModel(
        id: source['id'],
        breedName: source['name'],
        description: source['description'],
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
