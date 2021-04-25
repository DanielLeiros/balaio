import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  Iterable<String?> listElements = [];

  Dropdown({required this.listElements}) : super();

  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contato:',
            style: TextStyle(fontSize: 18),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: DropdownButton<String>(
              value: dropdownValue,
              hint: Text(
                'Selecione um contato',
                style: TextStyle(fontSize: 18),
              ),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: widget.listElements
                  .map<DropdownMenuItem<String>>((String? value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value ?? ' ', style: TextStyle(fontSize: 18)),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
