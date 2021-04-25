import 'package:geolocator/geolocator.dart';

class Location {
  dynamic loc = '';

  Location() {
    temporalLocation(20);
  }

  static Future<dynamic> getLocation(int interval) async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
