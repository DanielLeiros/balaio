import 'package:balaio/app/pages/menu.dart';
import 'package:balaio/app/service/balaio_controller.dart';
import 'package:balaio/app/widget/custom_input.dart';
import 'package:balaio/app/widget/circular_image.dart';
import 'package:balaio/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ModularState<ProfilePage, BalaioController> {
  bool terms = false;
  bool editingName = false;
  String name = '';

  TextStyle subTextStyle = TextStyle(fontSize: 17, color: BalaioTheme.gray);

  void toggleEditingName() {
    setState(() {
      editingName = !editingName;
    });
  }

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: controller.nome);
    final numController = TextEditingController(text: controller.numero);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 50, left: 15, right: 15, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'images/logo_n_bg.png',
                          scale: 7,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CircularImage(),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Balaios encontrados',
                          style: subTextStyle,
                        ),
                        Text(
                          controller.balaiosFound.toString(),
                          style: subTextStyle,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: CustomInput(
                            controller: nameController,
                            enebled: editingName,
                            fieldName: 'Nome',
                            onChange: (e) {},
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: CustomInput(
                            hint: '+55 (84) 991628702',
                            controller: numController,
                            enebled: editingName,
                            fieldName: 'Número',
                            onChange: (e) {},
                          ),
                        ),
                        SizedBox(
                          height: 110,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Menu(
            index: 1,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
