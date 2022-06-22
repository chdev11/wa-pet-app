import 'package:mobx/mobx.dart';
import 'package:wa_pet_app/app/modules/home/domain/entities/pet.dart';
import 'package:wa_pet_app/app/modules/home/domain/usecases/fetch_cats.dart';
import 'package:wa_pet_app/app/modules/home/domain/usecases/fetch_dogs.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final FetchCats _fetchCats;
  final FetchDogs _fetchDogs;

  @observable
  var pets = ObservableList<IPet>.of([]);

  HomeStoreBase(this._fetchCats, this._fetchDogs) {
    () async {
      var fetchCatsResul = await _fetchCats(2, 3);
      var fetchDogsResul = await _fetchDogs(2, 3);
      fetchCatsResul.fold((l) => print(l.message), (r) => pets.addAll(r));
      fetchDogsResul.fold((l) => print(l.message), (r) => pets.addAll(r));
    }();
  }
}
