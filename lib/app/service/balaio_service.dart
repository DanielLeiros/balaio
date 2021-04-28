import 'dart:convert';

import 'package:balaio/app/service/balaio_controller.dart';
import 'package:balaio/app/service/balaio_store.dart';
import 'package:balaio/theme/theme.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
        print(name);
        print(number);
        controller.nome = name;
        controller.numero = number;
        controller.userId = transient.toString();
        controller.transientUser = transient.toString();
        controller.setStoreData(name, number, transient.toString());
        controller.setUser(name, number, transient.toString());
      }
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  static Future<bool> validateUser(String number) async {
    var uri = Uri.parse('${url}users/${controller.transientUser}/validate');
    try {
      await http.post(uri, headers: {'token': number});
      return true;
    } catch (_) {
      return false;
    }
  }

  static Future<bool> sendBalaio(String message, String number) async {
    var uri = Uri.parse('${url}users/${controller.userId}/balaios');
    var loc = await controller.getLocation();
    print(controller.userId);
    try {
      await http.post(uri, headers: {
        'message': message,
        'to': number,
        'latitude': loc.latitude.toString(),
        'longitude': loc.longitude.toString()
      });
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  static Future<bool> searchBalaio() async {
    if (controller.userId.isNotEmpty) {
      var uri = Uri.parse('${url}users/${controller.userId}/balaios/search');
      var loc = await controller.getLocation();
      try {
        var response = await http.get(uri, headers: {
          'latitude': loc.latitude.toString(),
          'longitude': loc.longitude.toString()
        });
        if (json.decode(response.body)['balaioId'] != null) {
          await Fluttertoast.showToast(
            msg: "Você recebeu um novo Balaio!!",
          );
          Modular.get<BalaioStore>().unreadBalaios++;
        }
        return true;
      } catch (_) {
        return false;
      }
    }
    return false;
  }

  static Future<List<dynamic>> searchBalaios() async {
    if (controller.userId.isNotEmpty) {
      var uri = Uri.parse('${url}users/${controller.userId}/balaios/found');
      try {
        var response = await http.get(uri);
        List<dynamic> balaios = json.decode(response.body);
        Modular.get<BalaioStore>().balaiosFound = balaios.length;
        return balaios;
      } catch (_) {
        return [];
      }
    }
    return [];
  }
}
