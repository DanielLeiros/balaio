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

  void loadContacts() async {
    Iterable<Contact> contactsList =
        await ContactsService.getContacts(withThumbnails: false);
    setState(() => _contacts = contactsList);
    _contacts.forEach((element) {
      print(element);
      names.add(element.displayName ?? element.givenName);
    });
  }

  @override
  void initState() {
    loadContacts();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: MediaQuery.of(context).size.height * .5,
        width: MediaQuery.of(context).size.width * .7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Dropdown(listElements: names),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: CustomInput(
                    maxLines: 10,
                    fieldName: 'Mensagem',
                    onChange: () {},
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
