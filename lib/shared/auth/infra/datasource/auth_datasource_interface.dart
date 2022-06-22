import 'package:wa_pet_app/shared/auth/infra/repository/logged_user_adapter.dart';

abstract class IAuthDatasource {
  Future<LoggedUserAdapter?> login(String? email);
}
