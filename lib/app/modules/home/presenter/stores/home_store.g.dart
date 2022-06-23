// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$stateAtom = Atom(name: 'HomeStoreBase.state', context: context);

  @override
  IPetState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(IPetState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$selectionEnumAtom =
      Atom(name: 'HomeStoreBase.selectionEnum', context: context);

  @override
  PetSelectionEnum get selectionEnum {
    _$selectionEnumAtom.reportRead();
    return super.selectionEnum;
  }

  @override
  set selectionEnum(PetSelectionEnum value) {
    _$selectionEnumAtom.reportWrite(value, super.selectionEnum, () {
      super.selectionEnum = value;
    });
  }

  late final _$petsAtom = Atom(name: 'HomeStoreBase.pets', context: context);

  @override
  ObservableList<IPet> get pets {
    _$petsAtom.reportRead();
    return super.pets;
  }

  @override
  set pets(ObservableList<IPet> value) {
    _$petsAtom.reportWrite(value, super.pets, () {
      super.pets = value;
    });
  }

  late final _$increasePageAsyncAction =
      AsyncAction('HomeStoreBase.increasePage', context: context);

  @override
  Future<void> increasePage() {
    return _$increasePageAsyncAction.run(() => super.increasePage());
  }

  late final _$decreasePageAsyncAction =
      AsyncAction('HomeStoreBase.decreasePage', context: context);

  @override
  Future<void> decreasePage() {
    return _$decreasePageAsyncAction.run(() => super.decreasePage());
  }

  late final _$fetchSourcesAsyncAction =
      AsyncAction('HomeStoreBase.fetchSources', context: context);

  @override
  Future<void> fetchSources(int limit, int page) {
    return _$fetchSourcesAsyncAction.run(() => super.fetchSources(limit, page));
  }

  late final _$logoutAsyncAction =
      AsyncAction('HomeStoreBase.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void setSelectionEnum(PetSelectionEnum value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setSelectionEnum');
    try {
      return super.setSelectionEnum(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
selectionEnum: ${selectionEnum},
pets: ${pets}
    ''';
  }
}
