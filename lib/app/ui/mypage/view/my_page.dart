import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// configs
import 'package:hair_heist/app/config/palette.dart';
import 'package:hair_heist/app/config/global_styles.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.backgroundColor,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20.w, 39.w, 20.w, 0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 16.w, 0, 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                    ),
                    SizedBox(
                      width: 20.sp,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nickname',
                          style: GlobalStyle.primaryText.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 24.sp,
                          ),
                        ),
                        Text(
                          'email@domain.com',
                          style: GlobalStyle.primaryText.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  size: 36.w,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 550.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: 42.w,
                ),
                Container(
                  height: 30,
                  child: Text(
                    'Activity',
                    style: GlobalStyle.primaryText.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 24.sp,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.person_outline,
                        size: 36.w,
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Text(
                        'My Hair',
                        style: GlobalStyle.primaryText.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 10.w,
                  thickness: 1,
                ),
                Container(
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 36.w,
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Text(
                        'Favorites',
                        style: GlobalStyle.primaryText.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 10.w,
                  thickness: 1,
                ),
                Container(
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.keyboard_double_arrow_up,
                        size: 36.w,
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Text(
                        'Register as Designer',
                        style: GlobalStyle.primaryText.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 10.w,
                  thickness: 1,
                ),
                SizedBox(
                  height: 42.w,
                ),
                Container(
                  height: 30,
                  child: Text(
                    'Support',
                    style: GlobalStyle.primaryText.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 24.sp,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.mail_outline,
                        size: 36.w,
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Text(
                        'FAQ',
                        style: GlobalStyle.primaryText.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 10.w,
                  thickness: 1,
                ),
                Container(
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.mail_outline,
                        size: 36.w,
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Text(
                        'Customer Center',
                        style: GlobalStyle.primaryText.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 10.w,
                  thickness: 1,
                ),
                SizedBox(
                  height: 15.w,
                ),
                Column(
                  children: [
                    Text(
                      'Logout',
                      style: GlobalStyle.primaryText.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                          color: Palette.mainColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// TODO: Home Banner position
