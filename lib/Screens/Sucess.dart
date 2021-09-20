import 'package:flutter/material.dart';
import 'package:test_app/Constants/Pallete.dart';

class Sucess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.primary,
      body: Center(
        child: new Column(
          children: [
            SizedBox(
              height: 100.0,
            ),
            Image.asset(
              "assets/Successfull.png",
              height: 250,
              width: 250,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Post Submitted Sucessfully",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
