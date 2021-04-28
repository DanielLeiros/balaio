import 'package:balaio/app/service/balaio_controller.dart';
import 'package:balaio/app/service/balaio_service.dart';
import 'package:balaio/app/widget/custom_input.dart';
import 'package:balaio/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ValidateDialog extends StatefulWidget {
  @override
  _ValidateDialogState createState() => _ValidateDialogState();
}

class _ValidateDialogState
    extends ModularState<ValidateDialog, BalaioController> {
  String code = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: MediaQuery.of(context).size.height * .18,
        width: MediaQuery.of(context).size.width * .7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: CustomInput(
                      fieldName: 'Código de validação',
                      onChange: (e) {
                        setState(() => code = e);
                      },
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () async {
                bool validated = await BalaioService.validateUser(code);
                if (validated) {
                  Modular.to.popAndPushNamed('/home');
                }
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
                  'Verificar',
                  style: TextStyle(color: BalaioTheme.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
