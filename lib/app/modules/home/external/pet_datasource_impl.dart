import 'package:wa_pet_app/app/modules/home/domain/entities/cat.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/dog.dart';
import 'package:wa_pet_app/app/modules/home/domain/errors/pet_errors.dart';
import 'package:wa_pet_app/app/modules/home/infra/datasources/pet_datasource.dart';
import 'package:wa_pet_app/app/modules/home/infra/models/cat_model.dart';
import 'package:wa_pet_app/app/modules/home/infra/models/dog_model.dart';
import 'package:wa_pet_app/env.dart';
import 'package:wa_pet_app/shared/clients/implementations/dio_client.dart';

class PetDatasourceImpl implements IPetDatasource {
  final DioClient client;

  PetDatasourceImpl(this.client);

  @override
  Future<List<Cat>> fetchCats() async {
    final result = await client.get(baseCatUrl);
    if (result.statusCode == 200) {
      try {
        return (result.data as List).map((e) => CatModel.fromMap(e)).toList();
      } catch (e) {
        throw PetNormalizeException(e.toString());
      }
    } else if (result.statusCode == 400) {
      throw PetInvalidOrMissingParamException(result.data['error']);
    } else if (result.statusCode == 401) {
      throw PetUnauthorizedException('Unauthorized. ${result.data['error']}');
    } else {
      throw PetBadRequestException('Internal server error');
    }
  }

  @override
  Future<List<Dog>> fetchDogs() async {
    final result = await client.get(baseDogUrl);
    if (result.statusCode == 200) {
      try {
        return (result.data as List).map((e) => DogModel.fromMap(e)).toList();
      } catch (e) {
        throw PetNormalizeException(e.toString());
      }
    } else if (result.statusCode == 400) {
      throw PetInvalidOrMissingParamException(result.data['error']);
    } else if (result.statusCode == 401) {
      throw PetUnauthorizedException('Unauthorized. ${result.data['error']}');
    } else {
      throw PetBadRequestException('Internal server error');
    }
  }
}
