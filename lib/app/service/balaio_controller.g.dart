// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balaio_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BalaioController on _BalaioControllerBase, Store {
  final _$mapAtom = Atom(name: '_BalaioControllerBase.map');

  @override
  MapController get map {
    _$mapAtom.reportRead();
    return super.map;
  }

  @override
  set map(MapController value) {
    _$mapAtom.reportWrite(value, super.map, () {
      super.map = value;
    });
  }

  final _$nomeAtom = Atom(name: '_BalaioControllerBase.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$numeroAtom = Atom(name: '_BalaioControllerBase.numero');

  @override
  String get numero {
    _$numeroAtom.reportRead();
    return super.numero;
  }

  @override
  set numero(String value) {
    _$numeroAtom.reportWrite(value, super.numero, () {
      super.numero = value;
    });
  }

  final _$pathAtom = Atom(name: '_BalaioControllerBase.path');

  @override
  String get path {
    _$pathAtom.reportRead();
    return super.path;
  }

  @override
  set path(String value) {
    _$pathAtom.reportWrite(value, super.path, () {
      super.path = value;
    });
  }

  final _$transientUserAtom = Atom(name: '_BalaioControllerBase.transientUser');

  @override
  String get transientUser {
    _$transientUserAtom.reportRead();
    return super.transientUser;
  }

  @override
  set transientUser(String value) {
    _$transientUserAtom.reportWrite(value, super.transientUser, () {
      super.transientUser = value;
    });
  }

  final _$userIdAtom = Atom(name: '_BalaioControllerBase.userId');

  @override
  String get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(String value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  final _$balaiosFoundAtom = Atom(name: '_BalaioControllerBase.balaiosFound');

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

  final _$lastBalaioAtom = Atom(name: '_BalaioControllerBase.lastBalaio');

  @override
  ObservableMap<String, dynamic> get lastBalaio {
    _$lastBalaioAtom.reportRead();
    return super.lastBalaio;
  }

  @override
  set lastBalaio(ObservableMap<String, dynamic> value) {
    _$lastBalaioAtom.reportWrite(value, super.lastBalaio, () {
      super.lastBalaio = value;
    });
  }

  final _$unreadBalaiosAtom = Atom(name: '_BalaioControllerBase.unreadBalaios');

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

  final _$getLocalSystemDataAsyncAction =
      AsyncAction('_BalaioControllerBase.getLocalSystemData');

  @override
  Future<void> getLocalSystemData() {
    return _$getLocalSystemDataAsyncAction
        .run(() => super.getLocalSystemData());
  }

  final _$_BalaioControllerBaseActionController =
      ActionController(name: '_BalaioControllerBase');

  @override
  void setNameNumber(String name, String number, String path) {
    final _$actionInfo = _$_BalaioControllerBaseActionController.startAction(
        name: '_BalaioControllerBase.setNameNumber');
    try {
      return super.setNameNumber(name, number, path);
    } finally {
      _$_BalaioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void temporalLocation(int interval) {
    final _$actionInfo = _$_BalaioControllerBaseActionController.startAction(
        name: '_BalaioControllerBase.temporalLocation');
    try {
      return super.temporalLocation(interval);
    } finally {
      _$_BalaioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLastBalaio(dynamic received) {
    final _$actionInfo = _$_BalaioControllerBaseActionController.startAction(
        name: '_BalaioControllerBase.setLastBalaio');
    try {
      return super.setLastBalaio(received);
    } finally {
      _$_BalaioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
map: ${map},
nome: ${nome},
numero: ${numero},
path: ${path},
transientUser: ${transientUser},
userId: ${userId},
balaiosFound: ${balaiosFound},
lastBalaio: ${lastBalaio},
unreadBalaios: ${unreadBalaios}
    ''';
  }
}
