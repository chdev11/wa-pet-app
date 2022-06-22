import 'package:wa_pet_app/app/modules/home/domain/entities/cat.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/dog.dart';

abstract class IPetDatasource {
  Future<List<Cat>> fetchCats(int? limit, int? page);
  Future<List<Dog>> fetchDogs(int? limit, int? page);
}
