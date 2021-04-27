import 'package:balaio/theme/theme.dart';
import 'package:flutter/cupertino.dart';

class NotificationViewer extends StatelessWidget {
  final String notification;
  final String date;

  NotificationViewer({required this.date, required this.notification});

  TextStyle notificationStyle =
      TextStyle(color: BalaioTheme.black, fontSize: 20);
  TextStyle dateStyle = TextStyle(color: BalaioTheme.gray, fontSize: 14);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .90,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: BalaioTheme.white,
        border: Border(
          bottom: BorderSide(color: BalaioTheme.gray, width: .5),
        ),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$notification',
              style: notificationStyle,
            ),
            TextSpan(
              text: '\n',
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
