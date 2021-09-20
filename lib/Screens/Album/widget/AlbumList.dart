import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/Constants/Pallete.dart';
import 'package:test_app/Model/AlbumModel.dart';
import 'package:test_app/Provider/AlbumProvider.dart';
import 'package:test_app/Screens/Album/widget/SingleAlbum.dart';

//Generate Album List using future builder
class AlbumList extends StatefulWidget {
  @override
  _AlbumListState createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  //Future Builder attched to this
  Future<List<Album>> _fecthAlbums;

  @override
  void initState() {
    super.initState();
    //Initiate the future request
    Future.delayed(Duration.zero, () {
      final albumProvider = Provider.of<AlbumProvider>(context, listen: false);
      _fecthAlbums = albumProvider.fetchAlbums();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Running Album build");
    final albumProvider = Provider.of<AlbumProvider>(
        context); //For detecting any change in Album Model will reinitiate build method
    return Container(
      color: Pallete.primary,
      height: MediaQuery.of(context).size.height - 200,
      child: FutureBuilder(
        future: _fecthAlbums,
        initialData: [],
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
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
                        albumProvider.allAlbum.length == 0
                            ? Container()
                            : SingleAlbum(album: albumProvider.allAlbum[index]),
                    itemCount:
                        snapshot.hasData ? albumProvider.allAlbum.length : 0,
                  ),
      ),
    );
  }
}
