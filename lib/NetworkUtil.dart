import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkUtil {
//Header to be used in every POST request
  static final _headers = {'Content-type': 'application/json; charset=UTF-8'};

  //Bottleneck for every GET Request
  static Future<Response> callGetService(String url) async {
    try {
      print("Callling request $url}");
      //All app single GET method
      final Response response = await http.get(Uri.parse(url));
      return response;
    } catch (_) {
      //if error
      return null;
    }
  }

//Bottleneck for every POST Request
  static Future<Response> callPostService(String url, String body) async {
    try {
      print("Posting request $url}");
      //All app single POST method
      final Response response =
          await http.post(Uri.parse(url), headers: _headers, body: body);
      return response;
    } catch (_) {
      //if error
      return null;
    }
  }
}
