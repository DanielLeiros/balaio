import 'dart:async';
import 'package:balaio/app/models/message_model.dart';
import 'package:balaio/app/models/notification_model.dart';
import 'package:balaio/app/service/balaio_service.dart';
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
  int balaiosEncontrados = 0;
  @observable
  ObservableMap<String, dynamic> lastBalaio = ObservableMap();

  _BalaioControllerBase() {
    print('criando');
    temporalLocation(5);
    getLocalSystemData();
  }

  @action
  void setNameNumber(String name, String number, String path) {
    nome = name;
    numero = number;
    this.path = path;
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
    nome = prefs.getString('nome') ?? '';
    numero = prefs.getString('numero') ?? '';
    path = prefs.getString('path') ?? '';
    userId = prefs.getString('userId') ?? '';
    msgNonFriends = prefs.getBool('msgNonFriends') ?? true;
    isLogged = prefs.getBool('isLogged') ?? false;
  }

  Future<void> userExit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> setUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('nome', this.nome);
    prefs.setString('numero', this.numero);
    prefs.setString('path', path);
    prefs.setString('userId', transientUser);
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
