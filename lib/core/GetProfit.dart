import 'dart:convert';

import 'package:http/http.dart' as http;

class Back {
  Future<dynamic> GetProfit(
      DateTime startTime, DateTime endTime, String token) async {
    String body = '{"start": "$startTime", "end": "$endTime"}';
    Map<String, String> headers = {"Authorization": token};
    http.Response response = await http.post(
        'http://198.143.182.157/api/Salesmans/GetFinancialReport2?start=$startTime&end=$endTime',
        headers: headers);
    return response.body.toString();
  }
}
