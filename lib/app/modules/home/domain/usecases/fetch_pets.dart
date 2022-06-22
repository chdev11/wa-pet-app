import 'package:dartz/dartz.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/pet.dart';
import 'package:wa_pet_app/app/modules/home/domain/errors/pet_errors.dart';
import 'package:wa_pet_app/app/modules/home/domain/repositories/pet_repository.dart';

abstract class IFetchPets {
  Future<Either<IPetException, List<IPet>>> call();
}

class FetchPets implements IFetchPets {
  final IPetRepository repository;

  FetchPets(this.repository);

  @override
  Future<Either<IPetException, List<IPet>>> call() {
    return repository.fetchPets();
  }
}
