import 'package:dartz/dartz.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/pet.dart';
import 'package:wa_pet_app/app/modules/home/domain/errors/pet_errors.dart';
import 'package:wa_pet_app/app/modules/home/domain/repositories/pet_repository.dart';
import 'package:wa_pet_app/app/modules/home/domain/usecases/fetch_pets.dart';

class FetchDogs implements IFetchPets {
  final IPetRepository repository;

  FetchDogs(this.repository);

  @override
  Future<Either<IPetException, List<IPet>>> call(
      {required int limit, required int page}) {
    return repository.fetchDogs(limit, page);
  }
}
