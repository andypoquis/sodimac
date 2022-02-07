import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sodimac/app/data/models/authenticate.dart';
import 'package:sodimac/app/data/models/detailAuthenticate.dart';
import 'package:sodimac/app/data/models/referenceGuides.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<ReferenceGuides>?> fetchReferenceGuides(
      RxString endRangeDate, RxString startRangeDate) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json; charset=utf-8"
    };
    var body = jsonEncode({
      "from": startRangeDate.value,
      "to": endRangeDate.value,
      "storeId": 43
    });
    var response = await client.post(
        Uri.parse(
            'https://devnstapi.circulodeespecialistas.com.pe/api/referral-guide/filter'),
        body: body,
        headers: requestHeaders);

    if (response.statusCode == 200) {
      var jsonString = response.body;

      return referenceGuidesFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<Authenticate?> fetchAuthentication(
      String password, String username) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json; charset=utf-8"
    };
    var body = jsonEncode(
        {"username": username, "password": password, "appAplication": 10});
    var response = await client.post(
        Uri.parse(
            'https://devnstapi.circulodeespecialistas.com.pe/api/security/authenticate'),
        body: body,
        headers: requestHeaders);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return authenticateFromJson(jsonString);
    } else {
      Fluttertoast.showToast(
          msg: "A ocurrido un error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return null;
    }
  }

  static Future<DetailAuthenticate?> fetchDetailAuthentication(
      String password, String username) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json; charset=utf-8"
    };
    var body = jsonEncode(
        {"username": username, "password": password, "appAplication": 10});
    var response = await client.post(
        Uri.parse(
            'https://devnstapi.circulodeespecialistas.com.pe/api/security/detailAuthenticate'),
        body: body,
        headers: requestHeaders);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return detailAuthenticateFromJson(jsonString);
    } else {
      Fluttertoast.showToast(
          msg: "A ocurrido un error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return null;
    }
  }
}
