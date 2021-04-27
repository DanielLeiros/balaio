import 'package:balaio/app/service/balaio_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends ModularState<StartPage, BalaioController> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration(seconds: 3),
        () => controller.isLogged == false
            ? Modular.to.popAndPushNamed('/auth')
            : Modular.to.popAndPushNamed('/home'));
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset("images/logo_animation.gif"),
      ),
    );
  }
}
