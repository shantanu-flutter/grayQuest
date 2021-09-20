import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_app/Constants/Pallete.dart';

//JSON coded to be used to create JSON all over project
const JsonCodec JSON = const JsonCodec();

//Decoration for every text field
final inputTheme = InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5.0),
    fillColor: Pallete.secondary,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0), //                 <--- border radius here
        ),
        borderSide: BorderSide(
            width: 1.0, style: BorderStyle.solid, color: Pallete.secondary)),
    filled: true,
    hintStyle: TextStyle(color: Color(0xff6B6E6B), fontSize: 14.0));

//Simple label over text fields
Widget label(String text) {
  return Text(
    text,
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  );
}

//show Sanck bar for short duration
showSnackBar(BuildContext con, String Message) {
  final snackBar = SnackBar(
    content: const Text('Message'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Undo not work currently.
      },
    ),
  );
  ScaffoldMessenger.of(con).showSnackBar(snackBar);
}

class Constants {
  static final String api_Url = "https://jsonplaceholder.typicode.com/";

  //Post Model
  static final userId = "userId";
  static final name = "name";
  static final email = "email";
  static final id = "id";
  static final title = "title";
  static final body = "body";

  //Comment
  static final postId = "postId";

  //Album
  static final albumId = "albumId";
  static final url = "url";
  static final thumbnailUrl = "thumbnailUrl";
}
