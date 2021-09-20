import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/CommonWidget/NotificationText.dart';
import 'package:test_app/Constants/Pallete.dart';
import 'package:test_app/Constants/constants.dart';
import 'package:test_app/Model/PostModel.dart';
import 'package:test_app/Provider/PostProvider.dart';
import 'package:test_app/Provider/UserProvider.dart';
import 'package:test_app/Screens/Sucess.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final _formKey = new GlobalKey<FormState>();
  String _title;
  String _post;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Pallete.primary,
        appBar: new AppBar(
          title: Text("Create Post"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: new Form(
                key: _formKey,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.0),
                    label("Title"),
                    SizedBox(height: 5.0),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Title is required.'; //check if title is null
                        _title = value.trim();
                        return null;
                      },
                    ),
                    SizedBox(height: 15.0),
                    label("Post"),
                    SizedBox(height: 10.0),
                    TextFormField(
                      maxLines: 3,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Post is required.'; //check if post is null
                        _post = value.trim();
                        return null;
                      },
                      //decoration: inputTheme,
                    ),
                    Consumer<UserProvider>(
                      builder: (context, provider, child) =>
                          provider.notification ?? NotificationText(''),
                    ),
                    SizedBox(height: 40.0),
                    new MaterialButton(
                      height: 40.0,
                      minWidth: MediaQuery.of(context).size.width,
                      color: Pallete.primaryButtonColor,
                      onPressed: _submit,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          "Post",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    showSnackBar(context, "Submitting Response request");
    final form = _formKey.currentState;
    if (form.validate()) {
      Post val = await Provider.of<PostProvider>(context, listen: false)
          .createPost(_title, _post);
      if (val != null) {
        Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
              builder: (context) =>
                  new Sucess()), //When Authorized Navigate to the next screen
        );
      }
    }
  }
}
