import 'package:flutter/material.dart';
import 'package:test_app/Model/PostModel.dart';
import 'package:test_app/Screens/Post/Comment/CommentView.dart';

class SinglePost extends StatelessWidget {
  final Post singlePost;
  SinglePost(this.singlePost);

  @override
  Widget build(BuildContext context) {
    print("running build Single List");
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new ListTile(
                title: Text(
                  singlePost.title,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(singlePost.body,
                    style: TextStyle(color: Colors.white)),
              ),
              new GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              new CommentView()), //When Authorized Navigate to the next screen
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: new Text(
                      "View Comment",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ))
            ],
          )),
    );
  }
}
