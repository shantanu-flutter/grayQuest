import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/Constants/Pallete.dart';
import 'package:test_app/Model/AlbumPhotos.dart';
import 'package:transparent_image/transparent_image.dart';

class SingleAlbumPhoto extends StatelessWidget {
  final AlbumPhotos albumPhoto;

  SingleAlbumPhoto({Key key, this.albumPhoto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Pallete.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: <Widget>[
                Container(
                    height: 300.0,
                    child: const Center(
                        child: CircularProgressIndicator(
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.white)))),
                Center(
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: albumPhoto.url,
                  ),
                ),
              ],
            ),
            // new Container(
            //
            //   child: Image.network(albumPhoto.url,
            //
            //   ),
            // ),
            new Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                child: new Wrap(
                  children: [
                    new Text(
                      albumPhoto.title,
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
