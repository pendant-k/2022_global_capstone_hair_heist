import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// configs
import 'package:hair_heist/app/config/palette.dart';
import 'package:hair_heist/app/config/global_styles.dart';

import '../widgets/widgets.dart';

class DesingerMyPage extends StatelessWidget {
  const DesingerMyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Palette.backgroundColor,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(
                  20.w,
                  40.w,
                  20.w,
                  40.w,
                ),
                child: Container()
                //  MyPageHeader(
                //   onTap: () {},
                // ),
                ),
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
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        children: [
                          MyPageListTitle(data: 'Activity'),
                          SizedBox(
                            width: 30.w,
                          ),
                          Container(
                            width: 120.w,
                            height: 50.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Designer',
                                style: GlobalStyle.primaryText.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      MyPageItem(
                        icon: Icons.person_outline,
                        itemLabel: 'My Works',
                        onTap: () {},
                      ),
                      Divider(
                        height: 10.w,
                        thickness: 1,
                      ),
                      MyPageItem(
                        icon: Icons.favorite_border,
                        itemLabel: 'Favorites',
                        onTap: () {},
                      ),
                      Divider(
                        height: 10.w,
                        thickness: 1,
                      ),
                      MyPageItem(
                        icon: Icons.keyboard_double_arrow_down_outlined,
                        itemLabel: 'Deregister as User',
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
                          },
                          child: Text(
                            'Logout',
                            style: GlobalStyle.primaryText.copyWith(
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
          ],
        ),
      ),
    );
  }
}


// TODO: Home Banner position
