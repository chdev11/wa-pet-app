import 'package:dartz/dartz.dart';
import 'package:wa_pet_app/shared/auth/domain/auth_errors.dart';
import 'package:wa_pet_app/shared/auth/domain/logged_user.dart';

abstract class IAuthRepository {
  Future<Either<IAuthException, LoggedUser?>> login(String? email);
}
