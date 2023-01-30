import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hair_heist/app/ui/main_navigation/main_nav_page.dart';

class SpalshController extends GetxController {
  final _auth = FirebaseAuth.instance;
  // @override
  // void onReady() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   if (_auth.currentUser != null) {
  //     Get.to(() => MainNavigationPage());
  //   }
  // }
}
