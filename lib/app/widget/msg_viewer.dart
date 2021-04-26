import 'package:balaio/theme/theme.dart';
import 'package:flutter/cupertino.dart';

class MsgViewer extends StatelessWidget {
  String msg;
  String date;

  MsgViewer({required this.date, required this.msg});

  TextStyle msgStyle = TextStyle(color: BalaioTheme.black, fontSize: 20);
  TextStyle dateStyle = TextStyle(color: BalaioTheme.gray, fontSize: 14);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .90,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: BalaioTheme.white,
          border: Border.all(color: BalaioTheme.gray),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$msg',
              style: msgStyle,
            ),
            TextSpan(
              text: '\n\n',
            ),
            TextSpan(
              text: date,
              style: dateStyle,
            ),
          ],
          style: TextStyle(color: BalaioTheme.black),
        ),
      ),
    );
  }
}
