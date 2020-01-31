import 'package:http/http.dart';
import 'dart:convert';


getSalesManInfo() async{
  String url = 'http://198.143.182.157/api/Salesmans/GetAll';
  Map<String, String> headers = {
    "Content-type": "application/json",
    "Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEwNDgiLCJyb2xlIjoiQWRtaW4iLCJJZCI6IjEwNDgiLCJuYmYiOjE1ODAzNzExOTMsImV4cCI6MTU4MDk3NTk5MywiaWF0IjoxNTgwMzcxMTkzfQ.lV_HA4Bi_imrPNC7zm4lDIA41nwDr7IWvcGvVCvdxbY"
  };

  String myBody = '{"sortColumn": "id","order": "asc","take": 10,"skip": 0,"expressionFilters": []}';

  Response response = await post(url, body: myBody, headers: headers);
  final body = json.decode(utf8.decode(response.bodyBytes));

  return body;

}

getCustomerInfo() async{
  String url = 'http://198.143.182.157/api/Customers/GetAll';
  Map<String, String> headers = {
    "Content-type": "application/json",
    "Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEwNDgiLCJyb2xlIjoiQWRtaW4iLCJJZCI6IjEwNDgiLCJuYmYiOjE1ODAzNzExOTMsImV4cCI6MTU4MDk3NTk5MywiaWF0IjoxNTgwMzcxMTkzfQ.lV_HA4Bi_imrPNC7zm4lDIA41nwDr7IWvcGvVCvdxbY"
  };

  String myBody = '{"sortColumn": "id","order": "asc","take": 10,"skip": 0,"expressionFilters": []}';

  Response response = await post(url, body: myBody, headers: headers);
  final body = json.decode(utf8.decode(response.bodyBytes));

  print(body);
  return body;

}

toggleSuspend(int id) async{
  String url = 'http://198.143.182.157/api/Salesmans/Suspend?id=$id';
  Map<String, String> headers = {
    "Content-type": "application/json",
    "Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEwNDgiLCJyb2xlIjoiQWRtaW4iLCJJZCI6IjEwNDgiLCJuYmYiOjE1ODAzNzExOTMsImV4cCI6MTU4MDk3NTk5MywiaWF0IjoxNTgwMzcxMTkzfQ.lV_HA4Bi_imrPNC7zm4lDIA41nwDr7IWvcGvVCvdxbY"
  };

  Response response = await post(url, headers: headers);
  return response.statusCode;
}