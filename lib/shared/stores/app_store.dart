import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:wa_pet_app/shared/auth/domain/logged_user.dart';
import 'package:wa_pet_app/shared/auth/domain/usecases/auto_login_usecase.dart';
part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store {
  final IAutomaticLoginUsecase _automaticLoginUsecase;

  _AppStoreBase(
    this._automaticLoginUsecase,
  ) {
    () async {
      var user = await _automaticLoginUsecase.call();
      if (user != null) setLoggedUser(user);
    }();
  }

  @observable
  LoggedUser? loggedUser;

  @action
  void setLoggedUser(LoggedUser value) => loggedUser = value;

  @action
  void clearLoggedUser() => loggedUser = null;

  @action
  Future<void> checkLocalStorage() async {
    final result = await _automaticLoginUsecase();

    if (result is LoggedUser) {
      loggedUser = result;
    } else {
      loggedUser = LoggedUser.empty();
    }
  }
}
