import 'package:flutter_modular/flutter_modular.dart';
import 'package:wa_pet_app/app/modules/login/presenter/stores/login_store.dart';
import 'package:wa_pet_app/app/modules/login/ui/login_page.dart';
import 'package:wa_pet_app/shared/auth/domain/auth_repository_interface.dart';
import 'package:wa_pet_app/shared/auth/domain/usecases/login_usecase.dart';
import 'package:wa_pet_app/shared/auth/external/auth_datasource.dart';
import 'package:wa_pet_app/shared/auth/infra/datasource/auth_datasource_interface.dart';
import 'package:wa_pet_app/shared/auth/infra/repository/auth_repository.dart';
import 'package:wa_pet_app/shared/services/local_storage_service.dart';
import 'package:wa_pet_app/shared/stores/app_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthDatasourceImpl()),
    Bind.lazySingleton((i) => AuthRepositoryImpl(i<IAuthDatasource>())),
    Bind.lazySingleton((i) => LoginUsecase(i<IAuthRepository>())),
    Bind.lazySingleton((i) => LoginStore(
        i<AppStore>(), i<ILoginUsecase>(), i<ILocalStorageService>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const LoginPage()),
  ];
}
