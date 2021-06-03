import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:restarurent_assignment/model/RequestLogin.dart';
import 'package:restarurent_assignment/model/ResponseLogin.dart';
import 'package:restarurent_assignment/model/ResponseMenuItem.dart';
import 'package:restarurent_assignment/network/api_url.dart';

class APIService {
  static var client = http.Client();

  static Future<ResponseLogin> fetchLogin(String email, String password, bool isTermsAccepted, String restaurant) async {

    var response = await client.post(
      APIUrl.urlLogin,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        RequestLogin(
          email: email,
          restaurant: restaurant,
          password: password,
          isTermsAccepted: isTermsAccepted,
        ),
      ),
    );

    debugPrint("${response.statusCode}");

    if (response != null && response.statusCode == 200) {
      var jsonString = response.body;

      return responseLoginFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<List<ResponseMenuItem>> fetchMenuItems() async {
    var response = await client.get(APIUrl.urlMenuList);

    if (response != null && response.statusCode == 200) {
      var jsonString = response.body;

      return responseMenuItemFromJson(jsonString);
    } else {
      return null;
    }
  }
}
