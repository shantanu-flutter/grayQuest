import 'package:flutter/material.dart';
import 'package:test_app/Constants/Pallete.dart';
import 'package:test_app/Model/AlbumModel.dart';
import 'package:test_app/Screens/Album/AlbumDetails.dart';

class SingleAlbum extends StatelessWidget {
  final Album album;
  SingleAlbum({Key key, this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new ListTile(
          tileColor: Pallete.secondary,
          onTap: () {
            Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new AlbumDetails(
                        album: album,
                      )), //When Authorized Navigate to the next screen
            );
          },
          title: Text(
            album.title,
            style: TextStyle(color: Colors.white),
          ),
          trailing: new Icon(
            Icons.forward,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
