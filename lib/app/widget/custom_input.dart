import 'package:balaio/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  String fieldName = '';
  Function onChange = () {};
  bool? enebled;

  CustomInput({required this.fieldName, required this.onChange, this.enebled})
      : super();

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(widget.fieldName + ': '),
      TextField(
        enabled: widget.enebled ?? true,
        onChanged: widget.onChange(),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusColor: BalaioTheme.white),
      ),
    ]);
  }
}
