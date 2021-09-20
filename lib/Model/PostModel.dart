import 'package:test_app/Constants/constants.dart';

//Model class
class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({this.userId, this.id, this.title, this.body});

//Factory method to generate class object from Map<String, dynamic>
  factory Post.fromMap(Map<String, dynamic> json) => new Post(
        userId: json[Constants.userId],
        id: json[Constants.id],
        title: json[Constants.title],
        body: json[Constants.body],
      );

  @override
  String toString() {
    return 'Post{userId: $userId, id: $id, title: $title, body: $body} \n ';
  }
}
