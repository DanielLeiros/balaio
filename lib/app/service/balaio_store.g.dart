// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balaio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BalaioStore on _BalaioStoreBase, Store {
  final _$balaiosFoundAtom = Atom(name: '_BalaioStoreBase.balaiosFound');

  @override
  int get balaiosFound {
    _$balaiosFoundAtom.reportRead();
    return super.balaiosFound;
  }

  @override
  set balaiosFound(int value) {
    _$balaiosFoundAtom.reportWrite(value, super.balaiosFound, () {
      super.balaiosFound = value;
    });
  }

  final _$unreadBalaiosAtom = Atom(name: '_BalaioStoreBase.unreadBalaios');

  @override
  int get unreadBalaios {
    _$unreadBalaiosAtom.reportRead();
    return super.unreadBalaios;
  }

  @override
  set unreadBalaios(int value) {
    _$unreadBalaiosAtom.reportWrite(value, super.unreadBalaios, () {
      super.unreadBalaios = value;
    });
  }

  @override
  String toString() {
    return '''
balaiosFound: ${balaiosFound},
unreadBalaios: ${unreadBalaios}
    ''';
  }
}
