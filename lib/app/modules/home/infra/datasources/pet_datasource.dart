import 'package:wa_pet_app/app/modules/home/domain/entities/pet.dart';

abstract class IPetDatasource {
  Future<List<IPet>> fetchPets();
}
