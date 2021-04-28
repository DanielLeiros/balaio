import 'package:balaio/app/pages/menu.dart';
import 'package:balaio/app/widget/top_bar.dart';
import 'package:balaio/app/widget/notification_viewer.dart';
import 'package:balaio/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:balaio/app/service/balaio_controller.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState
    extends ModularState<NotificationPage, BalaioController> {
  List<Widget> generateMessageList() {
    List<Widget> msgs = [];
    controller.getNotifications().forEach((e) => msgs.add(
          Container(
            padding: EdgeInsets.all(5),
            child: NotificationViewer(
              notification: e.notification,
              date: e.date,
            ),
          ),
        ));
    msgs.add(SizedBox(
      height: 80,
    ));

    return msgs;
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
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: generateMessageList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Menu(
            index: 3,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
