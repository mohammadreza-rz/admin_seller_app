import 'package:http/http.dart';
import 'dart:convert';

class UserServer {

  getUsersInfo() async{
    String url = '';
    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    Response response = await get(url, headers: headers);
    final body = json.decode(utf8.decode(response.bodyBytes));

    return body;

  }
}