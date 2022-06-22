// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
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

  @override
  String toString() {
    return '''
pets: ${pets}
    ''';
  }
}
