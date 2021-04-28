import 'package:balaio/app/pages/menu.dart';
import 'package:balaio/app/widget/top_bar.dart';
import 'package:balaio/app/widget/notification_viewer.dart';
import 'package:balaio/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:balaio/app/service/balaio_controller.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends ModularState<ConfigPage, BalaioController> {
  bool terms = false;

  void toggleTerms() {
    setState(() {
      terms = !terms;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: BalaioTheme.primary,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
                child: TopBar(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: BalaioTheme.white,
              height: MediaQuery.of(context).size.height * .88,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height * .85,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .75,
                                child: Text(
                                  "Receber BalaiOs apenas dos meus contatos salvos",
                                  style: TextStyle(
                                      color: BalaioTheme.gray, fontSize: 22),
                                ),
                              ),
                              Checkbox(
                                value: terms,
                                onChanged: (e) => toggleTerms(),
                              ),
                            ]),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Modular.to.popAndPushNamed('/home');
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * .4,
                                padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                decoration: BoxDecoration(
                                    color: BalaioTheme.primary,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Voltar',
                                      style: TextStyle(
                                        color: BalaioTheme.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                controller.userExit();
                                Modular.to.popAndPushNamed('/auth');
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * .4,
                                padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                decoration: BoxDecoration(
                                    color: BalaioTheme.red,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Desconectar usuário',
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
