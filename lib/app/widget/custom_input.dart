import 'package:balaio/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  String fieldName = '';
  Function onChange = () {};
  bool? enebled;
  int? maxLines;
  String? hint;
  TextEditingController? controller;
  CustomInput(
      {required this.fieldName,
      required this.onChange,
      this.enebled,
      this.maxLines,
      this.hint,
      this.controller})
      : super();

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        widget.fieldName + ': ',
        style: TextStyle(fontSize: 18),
      ),
      TextField(
        controller: widget.controller ?? null,
        maxLines: widget.maxLines ?? 1,
        enabled: widget.enebled ?? true,
        onChanged: (e) => widget.onChange(e),
        decoration: InputDecoration(
            hintText: widget.hint ?? 'Digite aqui',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusColor: BalaioTheme.white),
      ),
    ]);
  }
}
