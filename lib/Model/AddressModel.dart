import 'package:test_app/Database/TablesColumnFile.dart';

//Address of user to be linked  to User
class UserAddress {
  int addressType;
  String street;
  String suite;
  String city;
  String zipCode;

  UserAddress(
      {this.addressType, this.street, this.suite, this.city, this.zipCode});

//Factory method to generate class object from Map<String, dynamic>
  factory UserAddress.fromMap(Map<String, dynamic> json) => new UserAddress(
        addressType: json[TablesColumnFile.addressType],
        street: json[TablesColumnFile.street],
        suite: json[TablesColumnFile.suite],
        city: json[TablesColumnFile.city],
        zipCode: json[TablesColumnFile.zipCode],
      );

  //Generate map of given object
  Map<String, dynamic> toMap() => {
        TablesColumnFile.addressType: addressType,
        TablesColumnFile.street: street,
        TablesColumnFile.suite: suite,
        TablesColumnFile.city: city,
        TablesColumnFile.zipCode: zipCode,
      };
}
