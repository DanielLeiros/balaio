import 'dart:convert';

import 'package:balaio/app/service/balaio_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class BalaioService {
  static String url = 'http://balaioapp.ddns.net:8082/balaio-api/v1/';
  static final controller = Modular.get<BalaioController>();

  static Future<bool> createUser(String name, String number) async {
    var uri = Uri.parse(url + 'users');
    try {
      var response =
          await http.post(uri, headers: {'nickname': name, 'number': number});
      var transient = json.decode(response.body)['userId'];
      if (transient != null) {
        controller.transientUser = transient;
      }
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  static Future<bool> validateUser(String number) async {
    var uri = Uri.parse('${url}users/$number/validate');
    try {
      await http.post(uri, headers: {'token': number});
      return true;
    } catch (_) {
      return false;
    }
  }
}
