import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/cat.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/dog.dart';
import 'package:wa_pet_app/app/modules/home/external/pet_datasource_impl.dart';
import 'package:wa_pet_app/app/modules/home/infra/datasources/pet_datasource.dart';
import 'package:wa_pet_app/app/modules/home/utils/cat_200.dart';
import 'package:wa_pet_app/app/modules/home/utils/dog_200.dart';
import 'package:wa_pet_app/shared/clients/implementations/dio_client.dart';

class DioClientMock extends Mock implements DioClient {}

void main() {
  late DioClient client;
  late IPetDatasource datasource;

  late int limit;
  late int page;

  setUp(() {
    client = DioClientMock();
    datasource = PetDatasourceImpl(client);

    limit = 30;
    page = 0;
  });

  test('should return a list of cat', () async {
    when(() => client.get(any(), query: '?limit=$limit&page=$page&order=desc'))
        .thenAnswer((_) async => Response(
              statusCode: 200,
              requestOptions: RequestOptions(path: ''),
              data: cat200,
            ));

    final future = datasource.fetchCats(limit, page);

    expect(future, completes);

    final result = await future;

    expect(result, isA<List<Cat>>());
  });

  test('should return a list of dog', () async {
    when(() => client.get(any(), query: '?limit=$limit&page=$page&order=desc'))
        .thenAnswer((_) async => Response(
              statusCode: 200,
              requestOptions: RequestOptions(path: ''),
              data: dog200,
            ));

    final future = datasource.fetchDogs(limit, page);

    expect(future, completes);

    final result = await future;

    expect(result, isA<List<Dog>>());
  });
}
