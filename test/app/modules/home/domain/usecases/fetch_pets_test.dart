import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/pet.dart';
import 'package:wa_pet_app/app/modules/home/domain/errors/pet_errors.dart';
import 'package:wa_pet_app/app/modules/home/domain/repositories/pet_repository.dart';
import 'package:wa_pet_app/app/modules/home/domain/usecases/fetch_pets.dart';

class PetRepositoryMock extends Mock implements IPetRepository {}

void main() {
  late IPetRepository repository;
  late IFetchPets usecase;

  setUp(() {
    repository = PetRepositoryMock();
    usecase = FetchPets(repository);
  });

  test('should return a list of pets', () async {
    when(() => repository.fetchPets())
        .thenAnswer((_) async => const Right(<IPet>[]));

    final future = usecase();

    expect(future, completes);

    final result = await future;

    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<IPet>>());
  });

  test('should return a pet datasource exception', () async {
    when(() => repository.fetchPets())
        .thenAnswer((_) async => Left(PetDatasourceException('')));

    final future = usecase();

    expect(future, completes);

    final result = await future;

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<PetDatasourceException>());
  });
}
