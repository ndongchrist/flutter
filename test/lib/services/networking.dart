import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({required this.url});
  final String url;

  Future getData() async {
    var url1 = Uri.parse(url);
    Response reponse = await get(url1);
    if (reponse.statusCode == 200) {
      var data = reponse.body;
      print(data);
      return jsonDecode(data);
    } else {
      print(reponse.statusCode);
    }
  }
}
// ''