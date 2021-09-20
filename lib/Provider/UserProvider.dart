import 'package:flutter/material.dart';
import 'package:test_app/CommonWidget/NotificationText.dart';
import 'package:test_app/Database/AppDatabase.dart';
import 'package:test_app/Model/UserModel.dart';

//Provider class
class UserProvider with ChangeNotifier {
  //Notification for giving error message at login
  NotificationText _notification;
  NotificationText get notification => _notification;

  User _user;
  User get user => _user;

  //Method to Request login
  Future<bool> login(String emailId, String password) async {
    _notification = null;
    notifyListeners(); //update notification messge to and try login

    //Request in LOCAL DB to get user details
    User user = await AppDatabase.get().getUserWithId(emailId);
    print("returmed user = $user");
    if (user == null) {
      //If no such user in LOCAL DB
      _notification = NotificationText('Invalid User ID');
      notifyListeners();
      return false;
    } else {
      //If there is a user with specified ID
      if (user.password.trim() == password) {
        //Successful password match
        _user = user;
        notifyListeners();
        return true;
      } else {
        //Password incorrect
        _notification = NotificationText('Password Incorrect');
        notifyListeners();
        return false;
      }
    }
  }
  //
  // Future<String> setSessionVariables(User user) async {
  //   SharedPreferences storage = await SharedPreferences.getInstance();
  //   storage.setInt(Constants.userId,user.userId );
  //   storage.setString(Constants.name,user.name );
  //   storage.setString(Constants.email,user.email );
  //   storage.setString(Constants.email,user.email );
  //   storage.setString(Constants.email,user.email );
  //   storage.setString(Constants.email,user.email );
  //   storage.setString(Constants.email,user.email );
  // }

}
