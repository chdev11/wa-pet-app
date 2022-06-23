import 'package:wa_pet_app/shared/auth/domain/auth_errors.dart';

abstract class ILoginState {}

class LoginReady implements ILoginState {}

class LoginLoading implements ILoginState {}

class LoginSuccess implements ILoginState {}

class LoginError implements ILoginState {
  final IAuthException error;

  LoginError(this.error);
}
