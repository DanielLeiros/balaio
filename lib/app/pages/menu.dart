import 'package:balaio/app/widget/top_bar.dart';
import 'package:balaio/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Menu extends StatelessWidget {
  final double iconSize = 30;

  final List<Map<String, dynamic>> items = [
    {"campo": "Mural", "path": "/mural", "icon": Icons.apps},
    {"campo": "Perfil", "path": "/perfil", "icon": Icons.person},
    {"campo": "Configurações", "path": "/config", "icon": Icons.settings},
    {"campo": "Perguntas freq.", "path": "/faq", "icon": Icons.question_answer},
  ];

  Widget getMenuItem(e) {
    return TextButton.icon(
        label: Text(
          e['campo'],
          style: TextStyle(fontSize: 18, color: BalaioTheme.white),
        ),
        icon: Icon(
          e['icon'],
          color: BalaioTheme.white,
        ),
        onPressed: () => Modular.to.pushNamed(
              e['path'],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          color: BalaioTheme.primary,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBar(
                  mainIcon: Icons.close,
                  mainPress: () => Modular.to.maybePop(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getMenuItem(items[0]),
                      getMenuItem(items[1]),
                      getMenuItem(items[2]),
                      getMenuItem(items[3]),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Divider(
                    color: BalaioTheme.white,
                    height: 50,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
