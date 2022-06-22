import 'dart:developer';

import 'package:wa_pet_app/env.dart';
import 'package:wa_pet_app/shared/auth/domain/logged_user.dart';
import 'package:wa_pet_app/shared/auth/infra/repository/logged_user_adapter.dart';
import 'package:wa_pet_app/shared/services/local_storage_service.dart';

abstract class IAutomaticLoginUsecase {
  Future<LoggedUser?> call();
}

class AutomaticLoginUsecase implements IAutomaticLoginUsecase {
  final ILocalStorageService localStorageService;

  AutomaticLoginUsecase(this.localStorageService);

  @override
  Future<LoggedUser?> call() async {
    try {
      var data = await localStorageService.read(storageUserCredentialsPath);
      return LoggedUserAdapter.fromMap(data);
    } catch (e) {
      log(e.toString(), name: "LoginUsecase/checkLocalStorageForUser");
    }
    return null;
  }
}
