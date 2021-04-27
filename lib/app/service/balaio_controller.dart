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
  String numero = '';
  @observable
  String path = '';
  bool msgNonFriends = true;
  bool isLogged = false;
  dynamic transientUser;

  _BalaioControllerBase() {
    temporalLocation(3);
    getLocalSystemData();
  }

  @action
  void getLocalSystemData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nome = prefs.getString('name') ?? '';
    numero = prefs.getString('numero') ?? '';
    path = prefs.getString('path') ?? '';
    msgNonFriends = prefs.getBool('msgNonFriends') ?? true;
    isLogged = prefs.getBool('isLogged') ?? false;
  }

  void userExit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  @action
  void setUser(String nome, String numero, String path) async {
    print('$nome $numero $path');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.nome = nome;
    prefs.setString('name', nome);
    this.numero = numero;
    prefs.setString('numero', numero);
    this.path = path;
    prefs.setString('path', path);
    prefs.setString('userId', transientUser['id']);
    prefs.setBool('isLogged', true);
  }

  @action
  void temporalLocation(int interval) {
    Timer.periodic(Duration(seconds: interval), (Timer timer) async {
      dynamic loc;
      loc = await getLocation();
      map.center = LatLng(loc.latitude, loc.longitude);
    });
  }

  Future<Position> getLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  List<Message> getMessages() {
    return [
      Message(
        msg: 'Balaioooooooooooooooooooooooooooooooooooooooooooooooo \n \n -D',
        date: '08/12/1996',
      ),
      Message(
        msg: 'Andrezinhooooooooooooooooooooooooooooooooooooooooooo \n \n -W',
        date: '08/12/1996',
      ),
      Message(
        msg: 'Wislaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa \n \n -A',
        date: '08/12/1996',
      ),
      Message(
        msg: 'Lorem ipsum \n \n -D',
        date: '08/12/1996',
      ),
      Message(
        msg:
            'Mussum Ipsum, cacilds vidis litro abertis. Detraxit consequat et quo num tendi nada. Paisis, filhis, espiritis santis. Aenean aliquam molestie leo, vitae iaculis nisl. Si num tem leite então bota uma pinga aí cumpadi! \n \n -M',
        date: '08/12/1996',
      ),
    ];
  }

  List<NotificationM> getNotifications() {
    return [
      NotificationM(
        notification: 'Um novo balaio foi deixado para você',
        date: '08/12/1996',
      ),
      NotificationM(
        notification: 'Google iniciou uma caçada por balaio',
        date: '08/12/1996',
      ),
      NotificationM(
        notification: 'Bem-vindo ao BalaiO!',
        date: '08/12/1996',
      ),
    ];
  }
}
