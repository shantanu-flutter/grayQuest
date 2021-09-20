import 'package:flutter/material.dart';
import 'package:test_app/Constants/constants.dart';
import 'package:test_app/Model/PostModel.dart';
import 'package:test_app/NetworkUtil.dart';
import 'dart:convert';

//Provider class
class PostProvider with ChangeNotifier {
  List<Post> _postList = [];

  Future<List<Post>> fetchArticles() async {
    _postList.clear();

    final url = '${Constants.api_Url}users/1/posts';
    try {
      var response = await NetworkUtil.callGetService(url);
      var data = json.decode(response.body);
      //print(data);
      _postList = data.map<Post>((json) => Post.fromMap(json)).toList();
      //print(_postList);
      notifyListeners();

      return Future.value(_postList);
    } catch (e) {
      return Future.error('An error occured');
    }
  }

  Future<Post> createPost(String title, String body) async {
    _postList.clear();
    final url = '${Constants.api_Url}posts';
    try {
      String _jsonString = await _toJson(title, body);
      var response = await NetworkUtil.callPostService(url, _jsonString);
      var data = json.decode(response.body);
      //print(data);
      Post _p = Post.fromMap(data); //parsing JSON to Model
      _postList.add(_p);
      notifyListeners();
      return Future.value(_p);
    } catch (e) {
      return Future.error('An error occured');
    }
  }

  //Refresh the list from API
  Future<void> refresh() async {
    _postList.clear();
    notifyListeners();
    await fetchArticles();
  }

  Future<void> clearList() async {
    _postList.clear();
    notifyListeners();
  }

  List<Post> get allPost => _postList ?? [];

  Future<String> _toJson(String title, String body) async {
    var _mapData = new Map();

    _mapData[Constants.userId] = 1;
    _mapData[Constants.title] = title ?? '';
    _mapData[Constants.body] = body ?? '';
    String json = JSON.encode(_mapData);
    print(json);
    return json;
  }
}
