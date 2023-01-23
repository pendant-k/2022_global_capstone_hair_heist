import 'package:get/get.dart';

class SignUpController extends GetxController {
  final email = "".obs;
  final password = "".obs;
  final confirmPassword = "".obs;
  final obscure = false.obs;
  get confirmed => password.value == confirmPassword.value;

  void toggleOpscure() {
    obscure.toggle();
  }
}
