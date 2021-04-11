import 'package:balaio/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  String? path;

  CircularImage({this.path});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipOval(
        child: Container(
          height: 150,
          width: 150,
          child: Image.asset(path ?? 'images/default-user-image.png'),
        ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: CircleAvatar(
          minRadius: 10,
          backgroundColor: BalaioTheme.gray,
          child: IconButton(
              icon: Icon(
                Icons.create,
                size: 35,
                color: BalaioTheme.white,
              ),
              onPressed: () {}),
        ),
      ),
    ]);
  }
}
