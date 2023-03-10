import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// configs
import 'package:hair_heist/app/config/palette.dart';
import 'package:hair_heist/app/config/global_styles.dart';
import 'package:hair_heist/app/ui/home/controller/main_nav_idx_controller.dart';
import 'package:hair_heist/app/ui/mypage/controller/mypage_controller.dart';
import 'package:hair_heist/app/ui/mypage/view/edit_profile.dart';

import '../widgets/widgets.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(MyPageController());
    final _navigationController = Get.put(MainNavIndexController());
    return SafeArea(
      child: Container(
        color: Palette.backgroundColor,
        width: double.infinity,
        child: _controller.authRepo.currentUser == null
            ? Container(
                child: Text('Please Sign in first'),
              )
            : Obx(
                () => _controller.userData.value == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(
                                20.w,
                                40.w,
                                20.w,
                                20.w,
                              ),
                              child: MyPageHeader(
                                userData: _controller.userData.value!,
                                onTap: () {
                                  Get.to(
                                    () => EditProfilePage(
                                        userData: _controller.userData.value!),
                                  );
                                },
                              )),
                          _controller.userData.value!.role == 'user'
                              ? SizedBox(
                                  height: 20.w,
                                )
                              : Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Container(
                                    width: double.infinity,
                                    height: 60.w,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Designer Profile',
                                          style:
                                              GlobalStyle.primaryText.copyWith(
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        Icon(
                                          Icons.chevron_right,
                                          size: 25.w,
                                          color: Palette.fontSecondaryColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                          SizedBox(height: 20.w),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: RefreshIndicator(
                                  onRefresh: () async {
                                    await _controller.fetchUserData();
                                  },
                                  child: ListView(
                                    children: [
                                      SizedBox(height: 10.w),
                                      Row(
                                        children: [
                                          MyPageListTitle(data: 'Activity'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.w,
                                      ),
                                      MyPageItem(
                                        icon: Icons.person_outline,
                                        itemLabel: 'My Hair',
                                        onTap: () {},
                                      ),
                                      Divider(
                                        height: 10.w,
                                        thickness: 1,
                                      ),
                                      MyPageItem(
                                        icon: Icons.favorite_border,
                                        itemLabel: 'Favorites',
                                        onTap: () {
                                          _navigationController
                                              .changeTabIndex(2);
                                        },
                                      ),
                                      Divider(
                                        height: 10.w,
                                        thickness: 1,
                                      ),
                                      MyPageItem(
                                        icon: Icons
                                            .keyboard_double_arrow_up_outlined,
                                        itemLabel: 'Register as Designer',
                                        onTap: () {},
                                      ),
                                      Divider(
                                        height: 10.w,
                                        thickness: 1,
                                      ),
                                      SizedBox(
                                        height: 42.w,
                                      ),
                                      MyPageListTitle(data: 'Support'),
                                      SizedBox(
                                        height: 10.w,
                                      ),
                                      MyPageItem(
                                          icon: Icons.question_mark_outlined,
                                          itemLabel: 'FAQ',
                                          onTap: () {}),
                                      Divider(
                                        height: 10.w,
                                        thickness: 1,
                                      ),
                                      MyPageItem(
                                        icon: Icons.margin_outlined,
                                        itemLabel: 'Customer Center',
                                        onTap: () {},
                                      ),
                                      Divider(
                                        height: 10.w,
                                        thickness: 1,
                                      ),
                                      SizedBox(height: 10.w),
                                      Align(
                                        alignment: Alignment.center,
                                        child: GestureDetector(
                                          onTap: () {
                                            print('logout');
                                            _controller.signOut();
                                          },
                                          child: Text(
                                            'Logout',
                                            style: GlobalStyle.primaryText
                                                .copyWith(
                                              fontSize: 16.sp,
                                              color: Palette.mainColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
      ),
    );
  }
}


// TODO: Home Banner position
