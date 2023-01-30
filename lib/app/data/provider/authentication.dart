// real url

import 'package:firebase_auth/firebase_auth.dart';

class AuthClient {
  final FirebaseAuth auth;
  AuthClient({required this.auth});

  // getter to get current user information
  get currentUser => auth.currentUser;

  Future<void> signIn(String email, String password) async {
    try {
      final _result = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(_result.user);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      final _result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(_result.user);
    } catch (e) {
      throw Exception(e);
    }
  }
  // final http.Client httpClient;
  // AuthApiClient({required this.httpClient});
  // Future<bool> login(String email, String password) async {
  //   try {
  //     var response = await httpClient.post(
  //       _baseUrlMock,
  //       body: {
  //         'email': email,
  //         'password': password,
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       print('logged In');
  //       return true;
  //     } else
  //       print('error');
  //     return false;
  //   } catch (_) {
  //     throw Exception('Cannot Logged In');
  //   }
  // }

  // Future<bool> logout() async {
  //   try {
  //     var _response = await httpClient.delete(_baseUrlMock);
  //     if (_response.statusCode == 200) {
  //       return true;
  //     } else {
  //       print('Fail to logout');
  //       return false;
  //     }
  //   } catch (_) {
  //     throw Exception('Cannot Logout');
  //   }
  // }
}
