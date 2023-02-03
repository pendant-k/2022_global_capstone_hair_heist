import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hair_heist/app/data/repository/authentication.dart';
import 'package:hair_heist/app/ui/main_navigation/main_nav_page.dart';

class SplashController extends GetxController {
  final _repo = AuthRepository(auth: FirebaseAuth.instance);
  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      Duration(milliseconds: 1000),
      () {
        if (_repo.currentUser != null) {
          Get.to(
            () => MainNavigationPage(),
          );
          Get.snackbar('Welcome Back', '${_repo.currentUser!.email}',
              duration: Duration(milliseconds: 1500));
        }
      },
    );
  }

  Future<void> guestLogin() async {
    try {
      Get.offAll(() => MainNavigationPage());
      Get.snackbar(
        'Welcome',
        'You are in Guest account now',
        duration: Duration(milliseconds: 1500),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
