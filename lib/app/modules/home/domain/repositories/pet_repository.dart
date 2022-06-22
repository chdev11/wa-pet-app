import 'package:dartz/dartz.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/pet.dart';
import 'package:wa_pet_app/app/modules/home/domain/errors/pet_errors.dart';

abstract class IPetRepository {
  Future<Either<IPetException, List<IPet>>> fetchPets();
}
