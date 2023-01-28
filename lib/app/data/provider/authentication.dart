import 'package:flutter/material.dart';
import 'package:hair_heist/app/data/model/user.dart';
import 'package:http/http.dart' as http;

var _baseUrlMock = Uri.parse('http://localhost:5000');

// real url
var _baseUrl = Uri.parse('');

class AuthApiClient {
  final http.Client httpClient;
  AuthApiClient({required this.httpClient});
  Future<bool> login(String email, String password) async {
    try {
      var response = await httpClient.post(
        _baseUrlMock,
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        print('logged In');
        return true;
      } else
        print('error');
      return false;
    } catch (_) {
      throw Exception('Cannot Logged In');
    }
  }

  Future<bool> logout() async {
    try {
      var _response = await httpClient.delete(_baseUrlMock);
      if (_response.statusCode == 200) {
        return true;
      } else {
        print('Fail to logout');
        return false;
      }
    } catch (_) {
      throw Exception('Cannot Logout');
    }
  }
}
