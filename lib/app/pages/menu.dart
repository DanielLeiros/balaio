import 'package:badges/badges.dart';
import 'package:balaio/app/pages/send_dialog.dart';
import 'package:balaio/app/service/balaio_controller.dart';
import 'package:balaio/app/service/balaio_store.dart';
import 'package:balaio/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Menu extends StatefulWidget {
  final int index;
  final BalaioController controller;

  Menu({this.index = 0, required this.controller});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    setState(() {
      currentIndex = widget.index;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    BalaioStore store = Modular.get<BalaioStore>();

    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1.0, 0.0), //(x,y)
              blurRadius: 88.0,
            ),
          ],
        ),
        width: size.width,
        height: 80,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(size.width, 80),
              painter: BNBCustomPainter(),
            ),
            Center(
              heightFactor: 0.6,
              child: FloatingActionButton(
                  backgroundColor: BalaioTheme.primary,
                  child: Icon(
                    Icons.add,
                    size: 33,
                  ),
                  elevation: 0.1,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SendDialog();
                        });
                  }),
            ),
            Container(
              width: size.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      size: 33,
                      color: currentIndex == 0
                          ? BalaioTheme.primary
                          : BalaioTheme.gray,
                    ),
                    onPressed: () {
                      setBottomBarIndex(0);
                      Modular.to.pushNamed('/home');
                    },
                    splashColor: Colors.white,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.person,
                        size: 33,
                        color: currentIndex == 1
                            ? BalaioTheme.primary
                            : BalaioTheme.gray,
                      ),
                      onPressed: () {
                        Modular.to.pushNamed('/perfil');
                      }),
                  Container(
                    width: size.width * 0.20,
                  ),
                  IconButton(icon: Observer(builder: (_) {
                    return Badge(
                      badgeColor: BalaioTheme.primary,
                      badgeContent: Text(
                        store.unreadBalaios.toString(),
                        style: TextStyle(color: BalaioTheme.white),
                      ),
                      showBadge: store.unreadBalaios > 0,
                      child: Icon(
                        Icons.grid_view,
                        size: 33,
                        color: currentIndex == 2
                            ? BalaioTheme.primary
                            : BalaioTheme.gray,
                      ),
                    );
                  }), onPressed: () {
                    store.unreadBalaios = 0;
                    setBottomBarIndex(2);
                    Modular.to.pushNamed('/mural');
                  }),
                  IconButton(
                      icon: Icon(
                        Icons.notifications,
                        size: 33,
                        color: currentIndex == 3
                            ? BalaioTheme.primary
                            : BalaioTheme.gray,
                      ),
                      onPressed: () {
                        setBottomBarIndex(3);
                        Modular.to.pushNamed('/notificacoes');
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, BalaioTheme.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
