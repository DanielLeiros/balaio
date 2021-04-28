import 'dart:async';
import 'package:balaio/app/models/notification_model.dart';
import 'package:balaio/app/service/balaio_service.dart';
import 'package:balaio/app/service/balaio_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'balaio_controller.g.dart';

class BalaioController = _BalaioControllerBase with _$BalaioController;

abstract class _BalaioControllerBase with Store {
  @observable
  MapController map = MapController(
    location: LatLng(-5.8837056, -35.1644988),
  );

  @observable
  String nome = '';
  @observable
  String numero = '';
  @observable
  String path = '';
  bool msgNonFriends = true;
  bool isLogged = false;
  @observable
  String transientUser = '';
  @observable
  String userId = '';
  @observable
  int balaiosFound = 0;
  @observable
  ObservableMap<String, dynamic> lastBalaio = ObservableMap();
  @observable
  int unreadBalaios = 0;

  _BalaioControllerBase() {
    print('criando');
    temporalLocation(5);
    getLocalSystemData();
  }

  @action
  void setStoreData(String nome, String numero, String id) {
    BalaioStore store = Modular.get<BalaioStore>();
    store.nome = nome;
    store.numero = numero;
    store.userId = id;
  }

  @action
  void temporalLocation(int interval) {
    Timer.periodic(Duration(seconds: interval), (Timer timer) async {
      dynamic loc;
      loc = await getLocation();
      map.center = LatLng(loc.latitude, loc.longitude);
      BalaioService.searchBalaio();
    });
  }

  @action
  Future<void> getLocalSystemData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    BalaioStore store = Modular.get<BalaioStore>();
    nome = prefs.getString('nome') ?? '';
    numero = prefs.getString('numero') ?? '';
    path = prefs.getString('path') ?? '';
    userId = prefs.getString('userId') ?? '';
    isLogged = prefs.getBool('isLogged') ?? false;
    if (nome == '') {
      nome = store.nome;
      numero = store.numero;
      userId = store.userId;
    }
  }

  Future<void> userExit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> setUser(String nome, String numero, String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('nome', nome);
    prefs.setString('numero', numero);
    prefs.setString('userId', id);
    prefs.setBool('isLogged', true);
  }

  @action
  void setLastBalaio(dynamic received) {
    lastBalaio = received;
  }

  Future<Position> getLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  List<NotificationM> getNotifications() {
    return [
      NotificationM(
        notification: 'Um novo balaio foi deixado para você',
        date: '28/04/2021',
      ),
      NotificationM(
        notification: 'Bem-vindo ao BalaiO!',
        date: '28/04/2021',
      ),
    ];
  }
}
