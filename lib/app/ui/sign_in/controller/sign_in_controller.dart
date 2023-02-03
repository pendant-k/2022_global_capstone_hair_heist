import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hair_heist/app/data/repository/authentication.dart';
import 'package:hair_heist/app/ui/main_navigation/main_nav_page.dart';

class SignInController extends GetxController {
  late AuthRepository repo;

  @override
  void onInit() {
    super.onInit();
    repo = AuthRepository(auth: FirebaseAuth.instance);
  }

  @override
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

  bool verify() {
    return true;
  }

  signIn() async {
    final _isVerified = verify();
    if (_isVerified) {
      try {
        final _result = await repo.signIn(email.value, password.value);
        Get.to(
          () => MainNavigationPage(),
        );
        Get.snackbar('Welcome Back', 'How are you today?');
      } on Exception catch (e) {
        print(e);
      }
    } else {
      Get.snackbar('Error', 'Can not sign in correctly');
    }
  }
}
