import 'package:test_app/Constants/constants.dart';

//Model class
class Comment {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Comment({this.postId, this.id, this.name, this.email, this.body});

  //Factory method to generate class object from Map<String, dynamic>
  factory Comment.fromMap(Map<String, dynamic> json) => new Comment(
        postId: json[Constants.postId],
        id: json[Constants.id],
        name: json[Constants.name],
        email: json[Constants.email],
        body: json[Constants.body],
      );
}
