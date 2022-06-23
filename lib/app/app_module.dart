import 'package:flutter_modular/flutter_modular.dart';
import 'package:wa_pet_app/app/modules/login/login_module.dart';
import 'package:wa_pet_app/app/modules/splash_page.dart';
import 'package:wa_pet_app/shared/auth/domain/usecases/auto_login_usecase.dart';
import 'package:wa_pet_app/shared/services/local_storage_service.dart';
import 'package:wa_pet_app/shared/stores/app_store.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => SharedPreferenceService()),
    Bind.lazySingleton((i) => AutomaticLoginUsecase(i<ILocalStorageService>())),
    Bind.singleton((i) => AppStore(i<IAutomaticLoginUsecase>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const SplashPage()),
    ModuleRoute("/login",
        module: LoginModule(),
        transition: TransitionType.rightToLeftWithFade,
        duration: const Duration(milliseconds: 500)),
    ModuleRoute("/home",
        module: HomeModule(),
        transition: TransitionType.rightToLeftWithFade,
        duration: const Duration(milliseconds: 500)),
  ];
}
