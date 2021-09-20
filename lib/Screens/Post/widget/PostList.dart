import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/Constants/Pallete.dart';
import 'package:test_app/Model/PostModel.dart';
import 'package:test_app/Provider/PostProvider.dart';
import 'package:test_app/Screens/Post/widget/SinglePost.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  Future<List<Post>> _fetchCategories;

  @override
  void initState() {
    super.initState();
    print("cdssss i  thai");
    Future.delayed(Duration.zero, () {
      final postProvider = Provider.of<PostProvider>(context, listen: false);
      _fetchCategories = postProvider.fetchArticles();
    });
  }


  @override
  Widget build(BuildContext context) {
    print("Running PostList builddddd");
    final postProvider = Provider.of<PostProvider>(context);
    return Container(
      color: Pallete.primary,
      height: MediaQuery.of(context).size.height - 200,
      child: FutureBuilder(
        future: _fetchCategories,
        initialData: [],
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: Container(
                        height: 100.0,
                        child: new CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.white),
                        )),
                  )
                : snapshot.hasError
                    ? Text(snapshot.error)
                    : ListView.builder(
                        shrinkWrap: true,
                        //physics:ScrollPhysics() ,
                        //scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) =>
                        postProvider.allPost.length == 0
                                ? Container()
                                : SinglePost(postProvider.allPost[index]),
                        itemCount: snapshot.hasData
                            ? postProvider.allPost.length
                            : 0,
                      ),
      ),
    );
  }
}
