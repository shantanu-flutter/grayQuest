import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/Constants/Pallete.dart';
import 'package:test_app/Screens/Login.dart';

//Utility method class
class Utitlies {

  //Confirmation alert to Logout
  static Future<bool> logoutApp(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [new Text('Log out ?')],
        ),
        content: Container(
          height: 105.0,
          child: new Column(
            children: [
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Text('You will logout of application',
                      style:
                          TextStyle(color: Color(0xff6B6E6B), fontSize: 14.0)),
                  new Text(".",
                      style:
                          TextStyle(color: Color(0xff6B6E6B), fontSize: 14.0))
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Text('Are you sure',
                      style:
                          TextStyle(color: Color(0xff6B6E6B), fontSize: 14.0)),
                  new Text(
                    "?",
                    style: TextStyle(color: Color(0xff6B6E6B), fontSize: 14.0),
                  )
                ],
              ),
              new SizedBox(
                height: 5.0,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: new MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          side: BorderSide(color: Color(0xff131513))),
                      height: 50.0,
                      minWidth: 100.0,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          'Cancel',
                          style: TextStyle(
                              color: Color(0xff131513), fontSize: 14.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          side: BorderSide(color: Pallete.primary)),
                      height: 50.0,
                      minWidth: 100.0,
                      color: Pallete.primary,
                      onPressed: () async {
                        //Empty all the stack and push Login page
                        Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => Login(),
                          ),
                          (route) =>
                              false, //if you want to disable back feature set to false
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          'Log Out',
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        //actions: <Widget>[],
      ),
    );
  }
}
