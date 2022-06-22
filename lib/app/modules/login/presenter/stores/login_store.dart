import 'package:mobx/mobx.dart';
import 'package:wa_pet_app/app/modules/login/presenter/states/login_state.dart';
import 'package:wa_pet_app/env.dart';
import 'package:wa_pet_app/shared/auth/domain/logged_user.dart';
import 'package:wa_pet_app/shared/auth/domain/usecases/login_usecase.dart';
import 'package:wa_pet_app/shared/auth/infra/repository/logged_user_adapter.dart';
import 'package:wa_pet_app/shared/services/local_storage_service.dart';
import 'package:wa_pet_app/shared/stores/app_store.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final AppStore _appStore;
  final ILocalStorageService _localStorageService;
  final ILoginUsecase _loginUsecase;

  _LoginStoreBase(
    this._appStore,
    this._loginUsecase,
    this._localStorageService,
  );

  @observable
  String email = "";

  @action
  void onChangeEmail(String value) => email = value.trim();

  @observable
  LoggedUser? user;

  @observable
  ILoginState state = LoginReady();

  @action
  Future<void> login() async {
    state = LoginLoading();

    final result = await _loginUsecase(email);

    result.fold((l) => state = LoginError(l), (r) async {
      user = r;
      var userAdapter = LoggedUserAdapter(email: user!.email);
      final stored = await _localStorageService
          .store(storageUserCredentialsPath, data: userAdapter.toMap());

      if (stored) {
        _appStore.setLoggedUser(user!);
        state = LoginSuccess();
      }
    });
  }
}
