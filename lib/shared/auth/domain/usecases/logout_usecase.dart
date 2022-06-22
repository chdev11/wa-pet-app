import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:wa_pet_app/env.dart';
import 'package:wa_pet_app/shared/auth/domain/auth_errors.dart';
import 'package:wa_pet_app/shared/services/local_storage_service.dart';

abstract class ILogoutUsecase {
  Future<Either<IAuthException, bool>> call();
}

class LogoutUsecase implements ILogoutUsecase {
  final ILocalStorageService _localStorageService;

  LogoutUsecase(this._localStorageService);

  @override
  Future<Either<IAuthException, bool>> call() async {
    if (storageUserCredentialsPath.isEmpty) {
      log("Received a empty path", name: "LogoutUsecase");
      return Left(LogoutException());
    }

    return Right(
        await _localStorageService.removeKey(storageUserCredentialsPath));
  }
}
