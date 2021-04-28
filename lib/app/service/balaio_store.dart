import 'package:mobx/mobx.dart';
part 'balaio_store.g.dart';

class BalaioStore = _BalaioStoreBase with _$BalaioStore;

abstract class _BalaioStoreBase with Store {
  String nome = '';
  String numero = '';
  bool isLogged = false;
  String userId = '';
  @observable
  int balaiosFound = 0;
  @observable
  int unreadBalaios = 0;
}
