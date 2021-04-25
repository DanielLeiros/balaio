import 'package:balaio/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(top: 100, left: 15, right: 15, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'images/logo_n_bg.png',
                scale: 7,
              ),
              Column(
                children: [
                  Image.asset(
                    'images/ilustrations/undraw_messaging.png',
                    scale: 3,
                  ),
                  Text(
                      'BalaiO tem como proposta permitir uma nova forma para manifestar amor digitalmente. Relembre bons momentos e espalhe carinho em todos os BalaiOs. ',
                      style: TextStyle(fontSize: 18, color: BalaioTheme.gray),
                      textAlign: TextAlign.center),
                ],
              ),
              TextButton(
                onPressed: () {
                  Modular.to.pushNamed('/auth');
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                      color: BalaioTheme.primary,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Continuar',
                        style: TextStyle(
                          color: BalaioTheme.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
