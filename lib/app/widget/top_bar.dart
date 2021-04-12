import 'package:balaio/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
    required this.mainIcon,
    required this.mainPress,
  }) : super(key: key);

  //0 for home and 1 for menu
  final IconData mainIcon;
  final Function mainPress;
  final double iconSize = 30;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          IconButton(
            icon: Icon(
              mainIcon,
              color: BalaioTheme.white,
              size: iconSize,
            ),
            onPressed: () => mainPress(),
          ),
          Image.asset(
            'images/logo_inv.png',
            scale: 12,
          ),
        ]),
        IconButton(
          icon: Icon(
            Icons.notifications_none_outlined,
            color: BalaioTheme.white,
            size: iconSize,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
