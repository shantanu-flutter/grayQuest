import 'package:test_app/Database/TablesColumnFile.dart';
import 'package:test_app/Model/AddressModel.dart';

//Model class
class User {
  int userId;
  String name;
  String email;
  String password;
  String website;
  String company;
  List<UserAddress> userAddress;

  User(
      {this.userId,
      this.name,
      this.email,
      this.password,
      this.website,
      this.company,
      this.userAddress});

//Factory method to generate class object from Map<String, dynamic>
  factory User.fromMap(Map<String, dynamic> json) => new User(
        userId: json[TablesColumnFile.userId],
        name: json[TablesColumnFile.name],
        email: json[TablesColumnFile.email],
        password: json[TablesColumnFile.password],
        website: json[TablesColumnFile.website],
        company: json[TablesColumnFile.company],
      );

  //Generate map of given object
  Map<String, dynamic> toMap() => {
        TablesColumnFile.userId: userId,
        TablesColumnFile.name: name,
        TablesColumnFile.email: email,
        TablesColumnFile.password: password,
        TablesColumnFile.website: website,
        TablesColumnFile.company: company,
      };
}
