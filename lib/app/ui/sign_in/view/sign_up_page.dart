import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hair_heist/app/ui/sign_in/controller/sign_up_controller.dart';

import '../../../config/global_styles.dart';
import '../../../config/palette.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(SignUpController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
            child: Stack(
              children: [
                Obx(
                  () => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 50.w),
                        SizedBox(height: 10.w),
                        Text(
                          'Sign Up',
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
                          onChanged: (value) {
                            _controller.updateName(value);
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                            ),
                            hintText: 'nickname',
                          ),
                        ),
                        SizedBox(height: 20.w),
                        TextField(
                          style: GlobalStyle.inputText,
                          onChanged: (value) {
                            _controller.updatePassword(value);
                          },
                          obscureText: _controller.obscure.value,
                          decoration: InputDecoration(
                            hintText: 'password',
                            prefixIcon: Icon(Icons.key),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _controller.toggleOpscure();
                              },
                              child: Icon(
                                Icons.remove_red_eye,
                                size: 20.w,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.w),
                        TextField(
                          onChanged: (value) {
                            _controller.updateConfirmPassword(value);
                          },
                          style: GlobalStyle.inputText,
                          obscureText: _controller.obscure.value,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.key),
                            hintText: 'confirm password',
                          ),
                        ),
                        SizedBox(height: 60.w),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              _controller.signUp();
                            },
                            child: Text('Sign Up'),
                          ),
                        ),
                        SizedBox(height: 20.w),
                      ]),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 25.w,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
