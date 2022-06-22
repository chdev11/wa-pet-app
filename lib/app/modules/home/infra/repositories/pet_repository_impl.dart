import 'package:dartz/dartz.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/dog.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/cat.dart';
import 'package:wa_pet_app/app/modules/home/domain/errors/pet_errors.dart';
import 'package:wa_pet_app/app/modules/home/domain/repositories/pet_repository.dart';
import 'package:wa_pet_app/app/modules/home/infra/datasources/pet_datasource.dart';

class PetRepositoryImpl implements IPetRepository {
  final IPetDatasource datasource;

  PetRepositoryImpl(this.datasource);

  @override
  Future<Either<IPetException, List<Cat>>> fetchCats(
      {required int limit, required int page}) async {
    try {
      final result = await datasource.fetchCats(limit: limit, page: page);
      return Right(result);
    } on IPetException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(PetDatasourceException(e.toString()));
    }
  }

  @override
  Future<Either<IPetException, List<Dog>>> fetchDogs(
      {required int limit, required int page}) async {
    try {
      final result = await datasource.fetchDogs(limit: limit, page: page);
      return Right(result);
    } on IPetException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(PetDatasourceException(e.toString()));
    }
  }
}
