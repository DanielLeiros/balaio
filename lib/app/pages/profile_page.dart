import 'package:balaio/app/widget/custom_input.dart';
import 'package:balaio/app/widget/circular_image.dart';
import 'package:balaio/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool terms = false;
  bool editingName = false;

  TextStyle subTextStyle = TextStyle(fontSize: 15, color: BalaioTheme.gray);

  void toggleEditingName() {
    setState(() {
      editingName = !editingName;
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
                  height: 30,
                ),
                Text(
                  'Balaios encontrados',
                  style: subTextStyle,
                ),
                Text(
                  '8',
                  style: subTextStyle,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .8,
                      child: CustomInput(
                        enebled: editingName,
                        fieldName: 'Nome',
                        onChange: () {},
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.create,
                        size: 30,
                        color: BalaioTheme.black,
                      ),
                      onPressed: () => toggleEditingName(),
                    )
                  ],
                ),
                SizedBox(height: 20),
                InternationalPhoneNumberInput(
                  isEnabled: false,
                  hintText: '(DD) número telefônico',
                  initialValue: PhoneNumber(
                    isoCode: 'BR',
                  ),
                  onInputChanged: (e) => print(e.isoCode),
                  inputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                SizedBox(
                  height: 110,
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
                          'Salvar alterações',
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