import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/pet.dart';
import 'package:wa_pet_app/app/modules/home/domain/errors/pet_errors.dart';
import 'package:wa_pet_app/app/modules/home/domain/repositories/pet_repository.dart';
import 'package:wa_pet_app/app/modules/home/infra/datasources/pet_datasource.dart';
import 'package:wa_pet_app/app/modules/home/infra/models/cat_model.dart';
import 'package:wa_pet_app/app/modules/home/infra/repositories/pet_repository_impl.dart';

class PetDatasourceMock extends Mock implements IPetDatasource {}

void main() {
  late IPetDatasource datasource;
  late IPetRepository repository;

  setUp(() {
    datasource = PetDatasourceMock();
    repository = PetRepositoryImpl(datasource);
  });

  test('should return a list of pet model', () async {
    when(() => datasource.fetchCats(limit: 30, page: 0))
        .thenAnswer((_) async => <CatModel>[]);

    final future = repository.fetchCats(limit: 30, page: 0);

    expect(future, completes);

    final result = await future;

    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<IPet>>());
  });

  test('should return a pet exception', () async {
    when(() => datasource.fetchCats(limit: 30, page: 0))
        .thenThrow(PetUnauthorizedException(''));

    final future = repository.fetchCats(limit: 30, page: 0);

    expect(future, completes);

    final result = await future;

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<IPetException>());
  });
}
