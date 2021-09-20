import 'package:test_app/Constants/constants.dart';

//Model class
class AlbumPhotos {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  AlbumPhotos({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  //Factory method to generate class object from Map<String, dynamic>
  factory AlbumPhotos.fromMap(Map<String, dynamic> json) => new AlbumPhotos(
        albumId: json[Constants.albumId],
        id: json[Constants.id],
        title: json[Constants.title],
        url: json[Constants.url],
        thumbnailUrl: json[Constants.thumbnailUrl],
      );
}
