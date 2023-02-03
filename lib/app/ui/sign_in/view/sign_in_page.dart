import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hair_heist/app/config/palette.dart';
import 'package:hair_heist/app/config/global_styles.dart';
import 'package:hair_heist/app/ui/main_navigation/main_nav_page.dart';
import 'package:hair_heist/app/ui/sign_in/controller/sign_in_controller.dart';

import 'sign_up_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(SignInController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 25.w,
                  ),
                ),
                SizedBox(height: 50.w),
                Text(
                  'Sign In',
                  style: GlobalStyle.primaryText.copyWith(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 30.w),
                TextField(
                  style: GlobalStyle.inputText,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'email@example.com',
                  ),
                  onChanged: (value) {
                    _controller.updateEmail(value);
                  },
                ),
                SizedBox(
                  height: 20.w,
                ),
                TextField(
                  style: GlobalStyle.inputText,
                  obscureText: _controller.obscure.value,
                  onChanged: (value) {
                    _controller.updatePassword(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'password',
                    prefixIcon: Icon(Icons.key),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _controller.toggleObscure();
                      },
                      child: Icon(
                        Icons.remove_red_eye,
                        size: 20.w,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.w),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // controller -> sign in
                      _controller.signIn();
                      // Get.to(() => MainNavigationPage());
                    },
                    child: Text('Sign In'),
                  ),
                ),
                SizedBox(height: 20.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: GlobalStyle.secondaryText,
                    ),
                    SizedBox(width: 5.w),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Get.to(() => SignUpPage());
                      },
                      child: Text(
                        'Create new one',
                        style: GlobalStyle.secondaryText.copyWith(
                          color: Palette.mainColor,
                        ),
                      ),
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }
}

// 최상단에 App Logo 추가