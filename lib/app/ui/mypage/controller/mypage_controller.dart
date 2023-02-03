import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hair_heist/app/config/global_styles.dart';
import 'package:hair_heist/app/data/repository/authentication.dart';
import 'package:hair_heist/app/ui/splash/splash.dart';

class MyPageController extends GetxController {
  late final AuthRepository authRepo;

  @override
  void onInit() {
    super.onInit();
    authRepo = AuthRepository(auth: FirebaseAuth.instance);
  }

  signOut() async {
    Get.dialog(AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 20.w, left: 20.w, right: 20.w),
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.w),
      title: Text('Log out'),
      content: Text('Are you sure to log out?'),
      actions: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              try {
                await authRepo.signOut();
                Get.offAll(() => SplashPage());
                Get.snackbar('Sign Out', 'Sign out correctly');
              } catch (e) {
                throw Exception(e);
              }
            },
            child: Text('Yes'),
          ),
        ),
        SizedBox(
          height: 10.w,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
            child: Text(
              'No',
              style: GlobalStyle.primaryText,
            ),
          ),
        )
      ],
    ));
  }
}
