import 'package:balaio/app/pages/menu.dart';
import 'package:balaio/app/service/balaio_service.dart';
import 'package:balaio/app/widget/top_bar.dart';
import 'package:balaio/app/widget/msg_viewer.dart';
import 'package:balaio/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:balaio/app/service/balaio_controller.dart';

class MuralPage extends StatefulWidget {
  @override
  _MuralPageState createState() => _MuralPageState();
}

class _MuralPageState extends ModularState<MuralPage, BalaioController> {
  List<dynamic> balaiosList = [];
  bool loading = true;

  List<Widget> generateMessageList() {
    List<Widget> msgs = [];
    if (balaiosList.isNotEmpty) {
      balaiosList.forEach((e) => msgs.add(
            Container(
              padding: EdgeInsets.all(5),
              child: MsgViewer(
                from: e['from']['nickname'],
                msg: e['message'],
                date: e['date'],
              ),
            ),
          ));
      msgs.add(SizedBox(
        height: 80,
      ));

      return msgs;
    } else {
      return [
        Icon(
          Icons.search,
          size: 30,
        ),
        Text('Você ainda não encontrou nenhum Balaio...',
            style: TextStyle(fontSize: 25))
      ];
    }
  }

  void getMessages() async {
    var response = await BalaioService.searchBalaios();
    if (response != balaiosList) {
      setState(() {
        balaiosList = response;
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getMessages();
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
                      children: loading
                          ? [
                              Column(
                                children: [
                                  Icon(
                                    Icons.search,
                                    size: 30,
                                  ),
                                  Text('Carregando balaios encontrados...',
                                      style: TextStyle(fontSize: 25))
                                ],
                              ),
                            ]
                          : generateMessageList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Menu(index: 2),
        ],
      ),
    );
  }
}
