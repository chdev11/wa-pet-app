import 'package:flutter_modular/flutter_modular.dart';
import 'package:wa_pet_app/env.dart';
import 'package:wa_pet_app/shared/clients/implementations/dio_client.dart';
import 'package:wa_pet_app/shared/clients/interceptors/auth_interceptor.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) =>
        DioClient(interceptors: [AuthInterceptor(apiSecret, apiLanguage)]))
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
