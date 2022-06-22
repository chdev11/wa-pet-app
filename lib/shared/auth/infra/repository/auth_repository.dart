import 'package:dartz/dartz.dart';
import 'package:wa_pet_app/shared/auth/domain/auth_errors.dart';
import 'package:wa_pet_app/shared/auth/domain/auth_repository_interface.dart';
import 'package:wa_pet_app/shared/auth/domain/logged_user.dart';
import 'package:wa_pet_app/shared/auth/infra/datasource/auth_datasource_interface.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final IAuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<Either<IAuthException, LoggedUser?>> login(String? email) async {
    try {
      final result = await datasource.login(email);

      return Right(result);
    } on IAuthException catch (e) {
      return Left(e);
    }
  }
}
