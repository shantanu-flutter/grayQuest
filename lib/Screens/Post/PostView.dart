import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/CommonWidget/TitleContainer.dart';
import 'package:test_app/Constants/Pallete.dart';
import 'package:test_app/Provider/PostProvider.dart';
import 'package:test_app/Screens/Post/CreatePost.dart';
import 'package:test_app/Screens/Post/widget/PostList.dart';

class PostView extends StatefulWidget {
  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    print("running build");
    var articlesProvider = Provider.of<PostProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      backgroundColor: Pallete.primary,
      floatingActionButton: FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) =>
                    new CreatePost()), //When Authorized Navigate to the next screen
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TitleContainer(
                  title: "Posti", subText: "This is  a random text inside post"),
              // new Container(
              //   width: MediaQuery.of(context).size.width,
              //   child: new Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text("Post", style: TextStyle(fontSize: 50.0 , color: Colors.white),)
              //     ],
              //   )
              // ),
              RefreshIndicator(
                  onRefresh: articlesProvider.refresh, child: PostList()),
            ],
          ),
        ),
      ),
    );
  }
}
