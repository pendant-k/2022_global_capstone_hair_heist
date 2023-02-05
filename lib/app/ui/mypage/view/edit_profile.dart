import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hair_heist/app/config/global_styles.dart';
import 'package:hair_heist/app/config/palette.dart';
import 'package:hair_heist/app/data/model/user.dart';
import 'package:hair_heist/app/data/repository/authentication.dart';
import 'package:hair_heist/app/data/repository/image_repository.dart';
import 'package:hair_heist/app/data/repository/user_data_repository.dart';
import 'package:hair_heist/app/ui/mypage/controller/edit_profile_controller.dart';
import 'package:hair_heist/app/ui/mypage/widgets/widgets.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({
    super.key,
    required this.userData,
  });
  final UserData userData;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      EditProfileController(
        userDataRepository: UserDataRepository(
          dio: Dio(),
        ),
        userData: userData,
        authRepository: AuthRepository(auth: FirebaseAuth.instance),
        imageRepository: ImageRepository(),
      ),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50.w),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            left: 20.w,
            right: 20.w,
          ),
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              size: 25.w,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.w,
            ),
            Text(
              'Edit Profile',
              style: GlobalStyle.primaryText.copyWith(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30.w,
            ),
            Obx(() => Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                      onTap: () {
                        controller.updateProfileImg();
                      },
                      child: userData.profileImgUrl == null
                          ? controller.selectedImg == ""
                              ? EmptyProfileImg(
                                  size: 100.w,
                                )
                              : Container(
                                  width: 100.w,
                                  height: 100.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Palette.grayE8,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.file(
                                      File(controller.selectedImg.value),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )
                          : controller.selectedImg == ""
                              ? Container(
                                  width: 100.w,
                                  height: 100.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Palette.grayE8,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      userData.profileImgUrl!,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )
                              : Container(
                                  width: 100.w,
                                  height: 100.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Palette.grayE8,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.file(
                                      File(controller.selectedImg.value),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )),
                )),
            SizedBox(
              height: 20.w,
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  EditFieldTitle(data: 'email'),
                  Container(
                    width: double.infinity,
                    height: 50.w,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Palette.grayE8,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      userData.email,
                      style: GlobalStyle.secondaryText,
                    ),
                  ),
                  SizedBox(
                    height: 20.w,
                  ),
                  EditFieldTitle(data: 'name'),
                  SizedBox(
                    height: 50.w,
                    child: TextFormField(
                      style: GlobalStyle.inputText,
                      initialValue: userData.name,
                      onChanged: (value) {
                        controller.updateName(value);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.w,
                  ),
                  EditFieldTitle(data: 'password'),
                  SizedBox(
                    height: 50.w,
                    child: Obx(() => TextFormField(
                          style: GlobalStyle.inputText,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                controller.isVisible.toggle();
                              },
                              child: Icon(
                                Icons.remove_red_eye,
                                size: 20.w,
                                color: controller.isVisible.value
                                    ? Palette.fontSecondaryColor
                                    : Palette.mainColor,
                              ),
                            ),
                          ),
                          initialValue: userData.password,
                          obscureText: controller.isVisible.value,
                        )),
                  ),
                  SizedBox(
                    height: 20.w,
                  ),
                  EditFieldTitle(data: 'confirm password'),
                  SizedBox(
                    height: 50.w,
                    child: Obx(() => TextFormField(
                          style: GlobalStyle.inputText,
                          initialValue: userData.password,
                          obscureText: controller.isVisible.value,
                          onChanged: (value) {
                            controller.updatePassword(value);
                          },
                        )),
                  ),
                  SizedBox(
                    height: 60.w,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.updateUserData();
                      },
                      child: Text(
                        'Submit',
                        style: GlobalStyle.whiteText,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class EditFieldTitle extends StatelessWidget {
  const EditFieldTitle({
    Key? key,
    required this.data,
  }) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.w),
      child: Text(
        data,
        style: GlobalStyle.primaryText.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
