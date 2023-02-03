import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:hair_heist/app/config/palette.dart';
import 'package:hair_heist/app/ui/sign_in/view/sign_in_page.dart';
import 'package:hair_heist/app/ui/splash/controller/splash_controller.dart';

import '../widgets/widgets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(SplashController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Palette.mainColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                      ),
                      Text(
                        'Hair Heist',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LoginButton(
                          textColor: Colors.white,
                          btnColor: Colors.black,
                          text: 'Sign-in',
                          onTap: () {
                            Get.to(() => SignInPage());
                          }),
                      SizedBox(height: 10.w),
                      LoginButton(
                        text: 'Guest account',
                        onTap: () {
                          _controller.guestLogin();
                        },
                      ),
                      SizedBox(
                        height: 40.w,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
