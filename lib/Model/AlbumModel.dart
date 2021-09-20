import 'package:test_app/Constants/constants.dart';

//Model class
class Album {
  int userId;
  int id;
  String title;

  Album({this.userId, this.id, this.title});

  //Factory method to generate class object from Map<String, dynamic>
  factory Album.fromMap(Map<String, dynamic> json) => new Album(
        userId: json[Constants.userId],
        id: json[Constants.id],
        title: json[Constants.title],
      );
}
