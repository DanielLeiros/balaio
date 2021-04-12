import 'package:balaio/app/widget/custom_input.dart';
import 'package:balaio/app/widget/dropdown.dart';
import 'package:balaio/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SendDialog extends StatefulWidget {
  @override
  _SendDialogState createState() => _SendDialogState();
}

class _SendDialogState extends State<SendDialog> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: MediaQuery.of(context).size.height * .5,
        width: MediaQuery.of(context).size.width * .7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Dropdown(),
            SizedBox(
              height: 20,
            ),
            Container(
              child: CustomInput(
                maxLines: 10,
                fieldName: 'Mensagem:',
                onChange: () {},
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Modular.to.maybePop();
                  },
                  child: Text(
                    'Cancelar',
                    style: TextStyle(color: BalaioTheme.primary, fontSize: 20),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Modular.to.maybePop();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: BalaioTheme.primary,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Enviar',
                      style: TextStyle(color: BalaioTheme.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
