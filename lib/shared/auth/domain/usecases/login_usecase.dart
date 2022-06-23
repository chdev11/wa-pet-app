import 'package:dartz/dartz.dart';
import 'package:wa_pet_app/shared/auth/domain/auth_errors.dart';
import 'package:wa_pet_app/shared/auth/domain/auth_repository_interface.dart';
import 'package:wa_pet_app/shared/auth/domain/logged_user.dart';

abstract class ILoginUsecase {
  Future<Either<IAuthException, LoggedUser?>> call(String? email);
}

class LoginUsecase implements ILoginUsecase {
  final IAuthRepository repository;

  LoginUsecase(this.repository);

  @override
  Future<Either<IAuthException, LoggedUser?>> call(String? email) async {
    if (email == null || email.isEmpty) {
      return Left(InvalidCredentialsException("Email cannot be null or empty"));
    }

    return await repository.login(email);
  }
}
