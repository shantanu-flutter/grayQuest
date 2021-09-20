import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/Constants/Pallete.dart';
import 'package:test_app/Model/AlbumModel.dart';
import 'package:test_app/Provider/AlbumProvider.dart';
import 'package:test_app/Screens/Album/widget/AlbumPhotoList.dart';

class AlbumDetails extends StatefulWidget {
  final Album album;
  AlbumDetails({Key key, @required this.album}) : super(key: key);

  @override
  _AlbumDetailsState createState() => _AlbumDetailsState();
}

class _AlbumDetailsState extends State<AlbumDetails> {
  @override
  Widget build(BuildContext context) {
    print("running Album View");
    return Scaffold(
      backgroundColor: Pallete.primary,
      appBar: AppBar(
        title: new Text(widget.album?.title ?? ''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              AlbumPhotoList(album: widget.album),
            ],
          ),
        ),
      ),
    );
  }
}
