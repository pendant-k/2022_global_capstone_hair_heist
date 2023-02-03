import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hair_heist/app/data/model/sign_up.dart';
import 'package:hair_heist/app/data/repository/authentication.dart';
import 'package:hair_heist/app/data/repository/user_data_repository.dart';
import 'package:hair_heist/app/ui/main_navigation/main_nav_page.dart';

class SignUpController extends GetxController {
  late AuthRepository auth;
  late UserDataRepository userRepo;

  @override
  void onInit() {
    super.onInit();
    auth = AuthRepository(auth: FirebaseAuth.instance);
    userRepo = UserDataRepository(dio: Dio());
  }

  final email = "".obs;
  final name = "".obs;
  final password = "".obs;
  final confirmPassword = "".obs;
  final obscure = false.obs;
  get confirmed => password.value == confirmPassword.value;

  void updateEmail(String value) {
    email.value = value;
  }

  void updateName(String value) {
    name.value = value;
  }

  void updatePassword(String value) {
    password.value = value;
  }

  void updateConfirmPassword(String value) {
    confirmPassword.value = value;
  }

  void toggleOpscure() {
    obscure.toggle();
  }

  Future<void> signUp() async {
    try {
      await auth.signUp(email.value, password.value);
      // create new sign up form to upload to server
      final _signUpForm = SignUpForm(
        name: name.value,
        email: email.value,
        password: password.value,
        confPassword: confirmPassword.value,
        role: 'user',
        uid: auth.currentUser!.uid,
      );
      await userRepo.createNewUserData(_signUpForm);
      Get.offAll(() => MainNavigationPage());
      Get.snackbar(
        'Welcome',
        'Hello, ${auth.currentUser!.email}',
        duration: Duration(milliseconds: 1500),
      );
    } catch (e) {
      Get.snackbar('Error', 'Can not sign up correctly');
    }
  }
}
