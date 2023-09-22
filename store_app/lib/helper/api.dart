import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }

    print('url = $url , token = $token'); // very important

    http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body)); // very important
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there was an erorr with stats code ${response.statusCode} with body ${response.body}');
    }
  }

  Future<dynamic> post({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    print('url = $url , body = $body , token = $token'); // very important

    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body)); // very important
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there was an erorr with stats code ${response.statusCode} with body ${response.body}');
    }
  }

  Future<dynamic> put({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
    });

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    print('url = $url , body = $body , token = $token'); // very important

    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body)); // very important
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there was an erorr with stats code ${response.statusCode} with body ${response.body}');
    }
  }
}
