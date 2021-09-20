import 'package:flutter/material.dart';
import 'package:test_app/Constants/Pallete.dart';

class InfoLabel extends StatelessWidget {
  final String title;
  final String details;
  InfoLabel({Key key, this.title, this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new Text(
                    title ?? '',
                    style: TextStyle(color: Colors.white),
                  ),
                  new Text(
                    details ?? '',
                    style: TextStyle(color: Pallete.secondary),
                  )
                ]),
          ),
        )
      ],
    );
  }
}
