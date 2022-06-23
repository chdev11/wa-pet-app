import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/pet.dart';
import 'package:wa_pet_app/app/modules/home/domain/usecases/fetch_cats.dart';
import 'package:wa_pet_app/app/modules/home/domain/usecases/fetch_dogs.dart';
import 'package:wa_pet_app/app/modules/home/presenter/states/pet_state.dart';
import 'package:wa_pet_app/app/modules/home/utils/pet_enums.dart';
import 'package:wa_pet_app/shared/auth/domain/usecases/logout_usecase.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final ILogoutUsecase _logoutUsecase;

  final FetchCats _fetchCats;
  final FetchDogs _fetchDogs;

  int limit = 15;
  int page = 0;

  HomeStoreBase(this._logoutUsecase, this._fetchCats, this._fetchDogs) {
    fetchSources(limit, page);
  }

  @observable
  IPetState state = PetReady();

  @observable
  PetSelectionEnum selectionEnum = PetSelectionEnum.all;

  @action
  void setSelectionEnum(PetSelectionEnum value) => selectionEnum = value;

  @observable
  var pets = ObservableList<IPet>.of([]);

  @action
  Future<void> increasePage() async {
    page++;
    await fetchSources(limit, page);
  }

  @action
  Future<void> decreasePage() async {
    if (page <= 0) return;
    page--;
    await fetchSources(limit, page);
  }

  @action
  Future<void> fetchSources(int limit, int page) async {
    state = PetLoading();

    pets = ObservableList<IPet>.of([]);

    var fetchCatsResul = await _fetchCats(limit: limit, page: page);
    var fetchDogsResul = await _fetchDogs(limit: limit, page: page);
    fetchCatsResul.fold((l) => state = PetError(l.message),
        (r) => [state = PetSuccess(), pets.addAll(r)]);
    fetchDogsResul.fold((l) => state = PetError(l.message),
        (r) => [state = PetSuccess(), pets.addAll(r)]);

    // pets.shuffle();
  }

  @action
  Future<void> logout() async {
    final result = await _logoutUsecase();
    result.fold((l) => null, (r) {
      Modular.to.pushReplacementNamed('/login');
    });
  }
}
