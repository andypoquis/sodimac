import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sodimac/app/data/models/referenceGuides.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<ReferenceGuides>?> fetchReferenceGuides() async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json; charset=utf-8"
    };
    var body =
        jsonEncode({"from": "2021/01/01", "to": "2022/02/01", "storeId": 43});
    var response = await client.post(
        Uri.parse(
            'https://devnstapi.circulodeespecialistas.com.pe/api/referral-guide/filter'),
        body: body,
        headers: requestHeaders);

    if (response.statusCode == 200) {
      var jsonString = response.body;

      return referenceGuidesFromJson(jsonString);
    } else {
      print(response.headers);

      print(response.statusCode);
      print(response.body);
      return null;
    }
  }
}
