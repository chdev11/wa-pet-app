import 'package:dartz/dartz.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/cat.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/dog.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/pet.dart';
import 'package:wa_pet_app/app/modules/home/domain/errors/pet_errors.dart';

abstract class IPetRepository {
  Future<Either<IPetException, List<Cat>>> fetchCats(int? limit, int? page);
  Future<Either<IPetException, List<Dog>>> fetchDogs(int? limit, int? page);
}
