import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hair_heist/app/ui/splash/splash.dart';

class MyPageController extends GetxController {
  final _auth = FirebaseAuth.instance;

  signOut() async {
    try {
      await _auth.signOut();
      Get.to(() => SplashPage());
      Get.snackbar('Sign Out', 'Sign out correctly');
    } catch (e) {
      throw Exception(e);
    }
  }
}
