import 'package:flutter/material.dart';
import 'package:test_app/Constants/constants.dart';
import 'package:test_app/Model/AlbumPhotos.dart';
import 'package:test_app/NetworkUtil.dart';
import 'dart:convert';

//Provider class
class AlbumPhotosProvider with ChangeNotifier {
  List<AlbumPhotos> _albumPhotoList = [];

//Return all photos atteched to album with ${albumId}
  Future<List<AlbumPhotos>> fetchAlbumsPhotos(int albumId) async {
    _albumPhotoList.clear();

    final _url = '${Constants.api_Url}albums/#{albumId}/photos';
    try {
      var response = await NetworkUtil.callGetService(
          _url.replaceAll("#{albumId}", "$albumId"));
      var data = json.decode(response.body);
      print(data);
      _albumPhotoList = data
          .map<AlbumPhotos>((json) => AlbumPhotos.fromMap(json))
          .toList(); //parsing JSON to Model List
      print(_albumPhotoList);
      notifyListeners();

      return Future.value(_albumPhotoList);
    } catch (e) {
      return Future.error('An error occured');
    }
  }

//Refresh the list from API
  Future<void> refresh(int albumId) async {
    _albumPhotoList.clear();
    notifyListeners();
    await fetchAlbumsPhotos(albumId);
  }

//Clear all the available Album photos
  Future<void> clearList() async {
    _albumPhotoList.clear();
    notifyListeners();
  }

  List<AlbumPhotos> get allAlbumPhotos => _albumPhotoList ?? [];
}
