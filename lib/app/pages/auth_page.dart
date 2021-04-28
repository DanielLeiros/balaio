import 'package:balaio/app/pages/validate_dialog.dart';
import 'package:balaio/app/service/balaio_controller.dart';
import 'package:balaio/app/service/balaio_service.dart';
import 'package:balaio/app/widget/custom_input.dart';
import 'package:balaio/app/widget/circular_image.dart';
import 'package:balaio/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends ModularState<AuthPage, BalaioController> {
  String phoneNumber = '';
  String name = '';
  bool terms = false;

  void toggleTerms() {
    setState(() {
      terms = !terms;
    });
  }

  bool fieldsOk() {
    return terms && name.isNotEmpty && phoneNumber.isNotEmpty;
  }

  void confirmAuth() {
    if (fieldsOk()) {
      BalaioService.createUser(name, phoneNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 10),
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
                      height: 50,
                    ),
                    CustomInput(
                        fieldName: 'Nome',
                        onChange: (e) => setState(() => name = e)),
                    SizedBox(height: 30),
                    CustomInput(
                        fieldName: 'Número',
                        hint: '+55 (84) 91234-0000',
                        onChange: (e) => setState(() => phoneNumber = e)),
                    SizedBox(height: 30),
                    Row(children: [
                      Checkbox(
                        value: terms,
                        onChanged: (e) => toggleTerms(),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .75,
                        child: Text(
                          "Aceito os termos e condições dispostas pela aplicação etc etc",
                          style:
                              TextStyle(color: BalaioTheme.gray, fontSize: 15),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                TextButton(
                  onPressed: terms
                      ? () {
                          confirmAuth();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ValidateDialog();
                              });
                        }
                      : null,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                        color:
                            fieldsOk() ? BalaioTheme.primary : BalaioTheme.gray,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Concluir',
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
          ),
        ),
      ),
    );
  }
}
