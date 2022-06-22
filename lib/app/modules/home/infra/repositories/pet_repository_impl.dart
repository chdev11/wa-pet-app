import 'package:wa_pet_app/app/modules/home/domain/errors/pet_errors.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/pet.dart';
import 'package:dartz/dartz.dart';
import 'package:wa_pet_app/app/modules/home/domain/repositories/pet_repository.dart';
import 'package:wa_pet_app/app/modules/home/infra/datasources/pet_datasource.dart';

class PetRepositoryImpl implements IPetRepository {
  final IPetDatasource datasource;

  PetRepositoryImpl(this.datasource);

  @override
  Future<Either<IPetException, List<IPet>>> fetchPets() async {
    try {
      final result = await datasource.fetchPets();
      return Right(result);
    } on IPetException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(PetDatasourceException(e.toString()));
    }
  }
}
