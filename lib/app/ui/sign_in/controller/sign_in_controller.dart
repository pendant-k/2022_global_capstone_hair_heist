import 'package:get/get.dart';

class SignInController extends GetxController {
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
}
