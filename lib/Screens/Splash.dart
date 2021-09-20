import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:test_app/Screens/Login.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 4,
      useLoader: false,
      // title: new Text('Welcome In SplashScreen'
      // ),
      image: new Image.asset('assets/Vector.png'),
      styleTextUnderTheLoader: const TextStyle(
          fontSize: 0.0, fontWeight: FontWeight.bold, color: Colors.black),

      backgroundColor: Colors.black,
      photoSize: 150.0,

      //loaderColor: Colors.red,
      //pageRoute: _createRoute(),
      navigateAfterSeconds: Login(),
    );
  }
}
