import 'package:flutter_modular/flutter_modular.dart';
import 'package:wa_pet_app/app/modules/home/domain/repositories/pet_repository.dart';
import 'package:wa_pet_app/app/modules/home/domain/usecases/fetch_cats.dart';
import 'package:wa_pet_app/app/modules/home/domain/usecases/fetch_dogs.dart';
import 'package:wa_pet_app/app/modules/home/external/pet_datasource_impl.dart';
import 'package:wa_pet_app/app/modules/home/infra/datasources/pet_datasource.dart';
import 'package:wa_pet_app/app/modules/home/infra/repositories/pet_repository_impl.dart';
import 'package:wa_pet_app/env.dart';
import 'package:wa_pet_app/shared/auth/domain/usecases/logout_usecase.dart';
import 'package:wa_pet_app/shared/clients/implementations/dio_client.dart';
import 'package:wa_pet_app/shared/clients/interceptors/auth_interceptor.dart';
import 'package:wa_pet_app/shared/services/local_storage_service.dart';
import 'presenter/stores/home_store.dart';

import 'ui/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LogoutUsecase(i<ILocalStorageService>())),
    Bind.lazySingleton((i) =>
        DioClient(interceptors: [AuthInterceptor(apiSecret, apiLanguage)])),
    Bind.lazySingleton((i) => PetDatasourceImpl(i<DioClient>())),
    Bind.lazySingleton((i) => PetRepositoryImpl(i<IPetDatasource>())),
    Bind.lazySingleton((i) => FetchCats(i<IPetRepository>())),
    Bind.lazySingleton((i) => FetchDogs(i<IPetRepository>())),
    Bind.lazySingleton(
        (i) => HomeStore(i<ILogoutUsecase>(), i<FetchCats>(), i<FetchDogs>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
