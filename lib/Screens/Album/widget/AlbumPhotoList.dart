import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/Constants/Pallete.dart';
import 'package:test_app/Model/AlbumModel.dart';
import 'package:test_app/Model/AlbumPhotos.dart';
import 'package:test_app/Provider/AlbumPhotosProvider.dart';
import 'package:test_app/Screens/Album/widget/SingleAlbumPhoto.dart';

class AlbumPhotoList extends StatefulWidget {
  final Album album;

  AlbumPhotoList({Key key, this.album}) : super(key: key);
  @override
  _AlbumPhotoListState createState() => _AlbumPhotoListState();
}

class _AlbumPhotoListState extends State<AlbumPhotoList> {
  Future<List<AlbumPhotos>> _fecthAlbumsPhotos;

  @override
  void initState() {
    super.initState();
    print("cdssss i  thai");
    Future.delayed(Duration.zero, () {
      final albumPhotosProvider =
          Provider.of<AlbumPhotosProvider>(context, listen: false);
      _fecthAlbumsPhotos =
          albumPhotosProvider.fetchAlbumsPhotos(widget.album.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Running Album build");
    final albumPhotosProvider = Provider.of<AlbumPhotosProvider>(context);
    return Container(
      color: Pallete.primary,
      height: MediaQuery.of(context).size.height,
      child: FutureBuilder(
        future: _fecthAlbumsPhotos,
        initialData: [],
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Container(height: 100.0, child: new CircularProgressIndicator())
            : snapshot.hasError
                ? Text(snapshot.error)
                : ListView.builder(
                    shrinkWrap: true,
                    //physics:ScrollPhysics() ,
                    //scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) =>
                        albumPhotosProvider.allAlbumPhotos.length == 0
                            ? Container()
                            : SingleAlbumPhoto(
                                albumPhoto:
                                    albumPhotosProvider.allAlbumPhotos[index]),
                    itemCount: snapshot.hasData
                        ? albumPhotosProvider.allAlbumPhotos.length
                        : 0,
                  ),
      ),
    );
  }
}
