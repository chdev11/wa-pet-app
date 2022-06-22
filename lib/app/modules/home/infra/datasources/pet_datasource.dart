import 'package:wa_pet_app/app/modules/home/domain/entities/cat.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/dog.dart';

abstract class IPetDatasource {
  Future<List<Cat>> fetchCats({required int limit, required int page});
  Future<List<Dog>> fetchDogs({required int limit, required int page});
}
