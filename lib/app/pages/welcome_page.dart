import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () => Modular.to.pushNamed('/auth'));
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset("images/logo_animation.gif"),
      ),
    );
  }
}
