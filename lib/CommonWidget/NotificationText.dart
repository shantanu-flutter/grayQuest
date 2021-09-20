import 'package:flutter/material.dart';

//Simple ALert text to be used with Consumer
class NotificationText extends StatelessWidget {
  final String text;
  final String type;

  NotificationText(this.text, {this.type, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Colors.red;
    //if for information blue other wise red message
    if ('info' == type) {
      color = Colors.blue;
    }

    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: color),
    );
  }
}
