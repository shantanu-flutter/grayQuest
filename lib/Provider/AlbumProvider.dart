import 'package:flutter/material.dart';
import 'package:test_app/Constants/constants.dart';
import 'package:test_app/Model/AlbumModel.dart';
import 'package:test_app/NetworkUtil.dart';
import 'dart:convert';

//Provider class
class AlbumProvider with ChangeNotifier {
  List<Album> _albumList = [];

//Return all Albums of USER 1
  Future<List<Album>> fetchAlbums() async {
    _albumList.clear();

    //User 1 is hardcoded
    final _url = '${Constants.api_Url}users/1/albums';
    try {
      var response = await NetworkUtil.callGetService(_url);
      var data = json.decode(response.body);
      print(data);
      _albumList = data
          .map<Album>((json) => Album.fromMap(json))
          .toList(); //parsing JSON to Model List
      print(_albumList);
      notifyListeners();

      return Future.value(_albumList);
    } catch (e) {
      return Future.error('An error occured');
    }
  }

  //Refresh the list from API
  Future<void> refresh() async {
    _albumList.clear();
    notifyListeners();
    await fetchAlbums();
  }

  Future<void> clearList() async {
    _albumList.clear();
    notifyListeners();
  }

  List<Album> get allAlbum => _albumList ?? [];
}
