import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// configs
import 'package:hair_heist/app/config/global_styles.dart';

import '../widgets/widgets.dart';
import 'package:hair_heist/app/ui/search/view/search_page.dart';
import 'package:hair_heist/app/ui/designer_info/view/desinger_info_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(20.w, 39.w, 20.w, 0),
        child: ListView(
          children: [
            Text(
              'Let\'s find cool hair styles',
              style: GlobalStyle.primaryText.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 24.sp,
              ),
            ),
            SizedBox(height: 15.w),
            HomeSearchBtn(
              onTap: () {
                Get.to(
                  () => SearchPage(),
                );
              },
            ),
            SizedBox(height: 15.w),
            HomeBanner(),
            SizedBox(height: 30.w),
            Row(
              children: [
                Text(
                  'What\'s new',
                  style: GlobalStyle.primaryText.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.w,
            ),
            Wrap(
              spacing: 8.0, // gap between adjacent chips
              runSpacing: 4.0,
              children: [
                GestureDetector(
                  child: Container(
                    width: 180.w,
                    height: 180.w,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onTap: () {
                    Get.to(
                      () => DesingerInfoPage(),
                    );
                  },
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
          ],
        ));
  }
}

// TODO: Home Banner position
// TODO:
