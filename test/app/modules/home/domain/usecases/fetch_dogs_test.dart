import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/cat.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/dog.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/pet.dart';
import 'package:wa_pet_app/app/modules/home/domain/errors/pet_errors.dart';
import 'package:wa_pet_app/app/modules/home/domain/repositories/pet_repository.dart';
import 'package:wa_pet_app/app/modules/home/domain/usecases/fetch_dogs.dart';
import 'package:wa_pet_app/app/modules/home/domain/usecases/fetch_pets.dart';

class PetRepositoryMock extends Mock implements IPetRepository {}

void main() {
  late IPetRepository repository;
  late IFetchPets usecase;

  late int limit;
  late int page;

  setUp(() {
    repository = PetRepositoryMock();
    usecase = FetchDogs(repository);

    limit = 30;
    page = 0;
  });

  test('should return a list of dog', () async {
    when(() => repository.fetchDogs(limit, page))
        .thenAnswer((_) async => const Right(<Dog>[]));

    final future = usecase(limit: limit, page: page);

    expect(future, completes);

    final result = await future;

    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<Dog>>());
  });

  test('should return a pet datasource exception', () async {
    when(() => repository.fetchDogs(limit, page))
        .thenAnswer((_) async => Left(PetDatasourceException('')));

    final future = usecase(limit: limit, page: page);

    expect(future, completes);

    final result = await future;

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<PetDatasourceException>());
  });
}
