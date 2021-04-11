import 'package:balaio/app/widget/custom_input.dart';
import 'package:balaio/app/widget/circular_image.dart';
import 'package:balaio/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool terms = false;

  void toggleTerms(bool val) {
    setState(() {
      terms = !terms;
    });
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
                  onChange: () {},
                ),
                SizedBox(height: 20),
                InternationalPhoneNumberInput(
                  hintText: '(DD) número telefônico',
                  initialValue: PhoneNumber(
                    isoCode: 'BR',
                  ),
                  onInputChanged: (e) => print(e.isoCode),
                  inputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                SizedBox(
                  height: 100,
                ),
                Row(children: [
                  Checkbox(
                    value: terms,
                    onChanged: (e) => toggleTerms,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .75,
                    child: Text(
                      "Aceito os termos e condições dispostas pela aplicação etc etc",
                      style: TextStyle(color: BalaioTheme.gray, fontSize: 15),
                    ),
                  ),
                ]),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    Modular.to.pushNamed('/home');
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                        color: BalaioTheme.primary,
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
