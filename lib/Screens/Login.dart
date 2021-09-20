import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/CommonWidget/NotificationText.dart';
import 'package:test_app/Constants/Pallete.dart';
import 'package:test_app/Constants/constants.dart';
import 'package:test_app/Provider/UserProvider.dart';
import 'package:test_app/Screens/DashBoard/Dashboard.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = new GlobalKey<FormState>();
  String _emailId;
  String _password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Pallete.primary,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(40.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.0),
                  Center(
                    child: Container(
                        child: Hero(//Hero tag from splash screen
                            tag: "splashscreenImage",
                            child: Image.asset('assets/Vector.png'))),
                  ),
                  SizedBox(height: 40.0),
                  label("Email"),
                  SizedBox(height: 5.0),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'User ID is required.'; //check if user id is null

                      _emailId = value.trim();
                      return null;
                    },
                    //decoration: inputTheme,
                  ),
                  SizedBox(height: 15.0),
                  label("Password"),
                  SizedBox(height: 10.0),
                  TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Password is required.'; //check if password is null

                      _password = value.trim();
                      return null;
                    },
                    onSaved: (value) => _password = value,
                  ),
                  SizedBox(height: 15.0),
                  Consumer<UserProvider>(
                    builder: (context, provider, child) =>
                        provider.notification ?? NotificationText(''),//error message shown here
                  ),
                  SizedBox(height: 10.0),
                  new MaterialButton(
                    height: 40.0,
                    minWidth: MediaQuery.of(context).size.width,
                    color: Pallete.primaryButtonColor,
                    onPressed: () async {
                      submit();//Login Request button
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> submit() async {//Login Request Submit
    final form = _formKey.currentState;
    if (form.validate()) {//Validating the form details if mot blank
      bool val = await Provider.of<UserProvider>(context, listen: false)
          .login(_emailId, _password);//return true if login login sucessfull
      if (val == true) {//IF success
        Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) =>
                  new DashBoard()), //When Authorized Navigate to the next screen
        );
      }
    }
  }
}
