import 'package:geolocator/geolocator.dart';

class Location {
  static Future<dynamic> getLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
