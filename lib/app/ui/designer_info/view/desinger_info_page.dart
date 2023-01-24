import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dotted_line/dotted_line.dart';

import 'package:hair_heist/app/ui/home/widgets/home_search_btn.dart';

// configs
import 'package:hair_heist/app/config/palette.dart';
import 'package:hair_heist/app/config/global_styles.dart';

class DesingerInfoPage extends StatelessWidget {
  const DesingerInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80.w,
          ),
          Container(
            width: double.infinity,
            height: 300.w,
            padding: EdgeInsets.fromLTRB(20.w, 39.w, 20.w, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              color: Palette.mainColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 60,
                ),
                SizedBox(height: 30.w),
                Text(
                  'Designer Name',
                  style: GlobalStyle.primaryText.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 24.sp,
                      color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.w),
                  child: DottedLine(
                    dashLength: 5.w,
                    lineThickness: 3.w,
                    dashColor: Colors.white,
                  ),
                ),
                Text(
                  'Designer Name',
                  style: GlobalStyle.primaryText.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 20.w, 0, 0),
            child: Text(
              'Works',
              style: GlobalStyle.primaryText.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 24.sp,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Wrap(
              spacing: 8.0, // gap between adjacent chips
              runSpacing: 4.0,
              children: [
                Container(
                  width: 180.w,
                  height: 180.w,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  width: 180.w,
                  height: 180.w,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  width: 180.w,
                  height: 180.w,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  width: 180.w,
                  height: 180.w,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// TODO: Home Banner position
