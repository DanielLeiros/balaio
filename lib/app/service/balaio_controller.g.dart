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

  final _$_BalaioControllerBaseActionController =
      ActionController(name: '_BalaioControllerBase');

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
  String toString() {
    return '''
map: ${map}
    ''';
  }
}
