import 'package:balaio/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TopBar extends StatelessWidget {
  final double iconSize = 30;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Image.asset(
            'images/logo_inv.png',
            scale: 9,
          ),
        ]),
        IconButton(
          icon: Icon(
            Icons.settings,
            color: BalaioTheme.white,
            size: iconSize,
          ),
          onPressed: () {
            Modular.to.pushNamed('/config');
          },
        ),
      ],
    );
  }
}
