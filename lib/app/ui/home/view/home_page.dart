import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// configs
import 'package:hair_heist/app/config/global_styles.dart';
import 'package:hair_heist/app/controller/main_nav_idx_controller.dart';

import '../widgets/widgets.dart';
import 'package:hair_heist/app/ui/search/view/search_page.dart';
import 'package:hair_heist/app/ui/designer_info/view/desinger_info_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _idxController = Get.put(MainNavIndexController());
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20.w, 50.w, 20.w, 0),
      child: RefreshIndicator(
        onRefresh: () async {
          print('home page refresh');
        },
        child: ListView(
          children: [
            Text(
              'Let\'s find cool hair styles',
              style: GlobalStyle.primaryText.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 24.sp,
              ),
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
        ),
      ),
    );
  }
}

class ImageBox extends StatelessWidget {
  const ImageBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      child: Container(
        width: 180.w,
        height: 180.w,
        alignment: Alignment.center,
        child: Text(
          'Image Box',
        ),
      ),
    );
  }
}

// TODO: Home Banner position
// TODO: Images
