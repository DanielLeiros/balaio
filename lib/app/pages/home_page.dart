import 'dart:developer';

import 'package:balaio/app/service/location.dart';
import 'package:balaio/app/widget/map_view.dart';
import 'package:balaio/app/widget/top_bar.dart';
import 'package:balaio/theme/theme.dart';
import 'package:balaio/app/pages/send_dialog.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Location service = Location();

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
                child: TopBar(
                    mainIcon: Icons.menu,
                    mainPress: () => Modular.to.pushNamed('/menu')),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * .88,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: MapView(),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FabCircularMenu(
          fabColor: BalaioTheme.primary,
          fabOpenColor: BalaioTheme.primary,
          fabCloseIcon: Icon(
            Icons.close,
            color: BalaioTheme.white,
          ),
          ringColor: BalaioTheme.primary,
          ringWidth: 100,
          ringDiameter: 300,
          fabOpenIcon: Image.asset(
            'images/balaio.png',
            scale: 13,
          ),
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.track_changes,
                  size: 30,
                  color: BalaioTheme.white,
                ),
                onPressed: () {
                  print('Radar');
                }),
            IconButton(
                icon: Icon(
                  Icons.add,
                  size: 30,
                  color: BalaioTheme.white,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SendDialog();
                      });
                }),
          ]),
    );
  }
}
