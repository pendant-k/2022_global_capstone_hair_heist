// real url

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthRepository {
  final FirebaseAuth auth;
  AuthRepository({required this.auth});

  // getter to get current user information
  User? get currentUser => auth.currentUser;

  Future<void> signIn(String email, String password) async {
    try {
      final _result = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(_result.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'user not found');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'wrong password');
      }
      throw Exception(e);
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

  Future<void> signOut() async {
    try {
      await auth.signOut();
      print('sign out');
    } catch (e) {
      throw Exception(e);
    }
  }
}
