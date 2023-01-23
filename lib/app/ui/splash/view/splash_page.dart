import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hair_heist/app/config/palette.dart';
import 'package:hair_heist/app/config/global_styles.dart';
import 'package:hair_heist/app/ui/main_navigation/main_nav_page.dart';
import 'package:hair_heist/app/ui/sign_in/view/sign_in_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          Get.to(() => MainNavigationPage());
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

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.btnColor = Colors.white,
    this.textColor = Palette.fontPrimaryColor,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;
  final Color btnColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: btnColor,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: GlobalStyle.primaryText.copyWith(color: textColor),
        ),
      ),
    );
  }
}
