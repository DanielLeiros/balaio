import 'dart:async';
import 'package:balaio/app/models/message_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
part 'balaio_controller.g.dart';

class BalaioController = _BalaioControllerBase with _$BalaioController;

abstract class _BalaioControllerBase with Store {
  @observable
  MapController map = MapController(
    location: LatLng(-5.8837056, -35.1644988),
  );

  _BalaioControllerBase() {
    temporalLocation(20);
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
}
