import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hair_heist/app/config/palette.dart';
import 'package:hair_heist/app/config/global_styles.dart';
import 'package:hair_heist/app/ui/sign_in/controller/sign_in_controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(SignInController());

    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.w),
                Text(
                  'Sign-in',
                  style: GlobalStyle.primaryText.copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    _controller.updateEmail(value);
                  },
                ),
                SizedBox(
                  height: 20.w,
                ),
                Obx(
                  () => TextField(
                    obscureText: _controller.obscure.value,
                    onChanged: (value) {
                      _controller.updateEmail(value);
                    },
                    decoration: InputDecoration(
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
                ),
                SizedBox(height: 10.w),
                ElevatedButton(onPressed: () {}, child: Text('Sign-In'))
              ]),
        ),
      ),
    );
  }
}
