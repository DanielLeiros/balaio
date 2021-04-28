import 'dart:async';

import 'package:balaio/app/service/balaio_service.dart';
import 'package:balaio/app/widget/custom_input.dart';
import 'package:balaio/app/widget/dropdown.dart';
import 'package:balaio/theme/theme.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SendDialog extends StatefulWidget {
  @override
  _SendDialogState createState() => _SendDialogState();
}

class _SendDialogState extends State<SendDialog> {
  Iterable<Contact> _contacts = [];
  List<String?> names = [];
  Map<String, dynamic> contactNumbers = {};
  String contactSelected = '';
  String message = '';
  bool sended = false;
  bool notify = false;
  bool carregando = false;

  void loadContacts() async {
    Iterable<Contact> contactsList =
        await ContactsService.getContacts(withThumbnails: false);
    setState(() => _contacts = contactsList);
    _contacts.forEach((element) {
      names.add(element.displayName ?? element.givenName);
      contactNumbers['${element.displayName}'] = element.phones;
    });
  }

  Future<bool> sendBalaio() async {
    setState(() {
      carregando = true;
      notify = true;
    });

    String number = '';
    contactNumbers[contactSelected].toSet().forEach((e) => {
          if (e.value != null)
            number = e.value.toString().replaceAll(' ', '').replaceAll('-', '')
        });

    if (number.isNotEmpty && message.isNotEmpty) {
      var isSended = await BalaioService.sendBalaio(message, number);

      setState(() {
        sended = isSended;
        carregando = false;
      });
      Future.delayed(Duration(seconds: 3), () => Modular.to.maybePop());
      return true;
    }
    return false;
  }

  @override
  void initState() {
    loadContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: MediaQuery.of(context).size.height * .5,
        width: MediaQuery.of(context).size.width * .7,
        child: notify
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: carregando
                    ? [
                        Icon(
                          Icons.send_to_mobile,
                          size: 30,
                        ),
                        Text('Enviando...', style: TextStyle(fontSize: 25))
                      ]
                    : [
                        Icon(
                          sended ? Icons.check : Icons.close,
                          size: 40,
                          color: sended ? BalaioTheme.primary : BalaioTheme.red,
                        ),
                        Text(
                          sended
                              ? 'Balaio enviado com sucesso'
                              : 'Não foi possível enviar o Balaio :/',
                          style: TextStyle(fontSize: 25),
                        )
                      ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Dropdown(
                        listElements: names,
                        onSelect: (e) => setState(() {
                          contactSelected = e;
                        }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: CustomInput(
                          maxLines: 10,
                          fieldName: 'Mensagem',
                          onChange: (e) {
                            setState(() => message = e);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Modular.to.maybePop();
                        },
                        child: Text(
                          'Cancelar',
                          style: TextStyle(
                              color: BalaioTheme.primary, fontSize: 20),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          sendBalaio();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            color: BalaioTheme.primary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child: Text(
                            'Enviar',
                            style: TextStyle(
                                color: BalaioTheme.white, fontSize: 20),
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
