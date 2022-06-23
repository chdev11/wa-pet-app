import 'dart:convert';

import 'package:wa_pet_app/env.dart';
import 'package:wa_pet_app/shared/auth/domain/auth_errors.dart';
import 'package:wa_pet_app/shared/auth/infra/datasource/auth_datasource_interface.dart';
import 'package:wa_pet_app/shared/auth/infra/repository/logged_user_adapter.dart';

class AuthDatasourceImpl implements IAuthDatasource {
  @override
  Future<LoggedUserAdapter?> login(String? email) async {
    List credentials = jsonDecode(authorizedCredentials);

    if (email != null && email.isNotEmpty) {
      try {
        return LoggedUserAdapter.fromMap(
            credentials.firstWhere((element) => element['email'] == email));
      } catch (e) {
        throw UserNotFoundException();
      }
    }

    throw InvalidCredentialsException();
  }
}
