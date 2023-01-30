import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hair_heist/app/ui/main_navigation/main_nav_page.dart';

class SignInController extends GetxController {
  @override
  final _auth = FirebaseAuth.instance;
  // email && password textfield
  final email = ''.obs;
  final password = ''.obs;
  // boolean for obscureText
  final obscure = true.obs;

  updateEmail(String value) {
    email.value = value;
  }

  updatePassword(String value) {
    password.value = value;
  }

  toggleObscure() {
    obscure.toggle();
  }

  verify() {}

  signIn() async {
    try {
      final _result = await _auth.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );
      Get.to(
        () => MainNavigationPage(),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
