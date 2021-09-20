import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/CommonWidget/TitleContainer.dart';
import 'package:test_app/Constants/Pallete.dart';
import 'package:test_app/Provider/AlbumProvider.dart';
import 'package:test_app/Screens/Album/widget/AlbumList.dart';

class AlbumView extends StatefulWidget {
  @override
  _AlbumViewState createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  @override
  Widget build(BuildContext context) {
    print("running Album View");
    var articlesProvider = Provider.of<AlbumProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      backgroundColor: Pallete.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TitleContainer(
                  title: "Album",
                  subText: "This is  a random text inside Album"),
              RefreshIndicator(
                  onRefresh: articlesProvider.refresh, child: AlbumList()),
            ],
          ),
        ),
      ),
    );
  }
}
