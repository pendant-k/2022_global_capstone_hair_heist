import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// configs
import 'package:hair_heist/app/config/global_styles.dart';
import 'package:hair_heist/app/data/repository/hairstyle_repository.dart';
import 'package:hair_heist/app/ui/detail/view/detail_page.dart';
import 'package:hair_heist/app/ui/home/controller/home_controller.dart';
import 'package:hair_heist/app/ui/home/controller/main_nav_idx_controller.dart';

import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(
      HomeController(
        HairStylesRepository(db: FirebaseFirestore.instance),
      ),
    );
    final _idxController = Get.put(MainNavIndexController());
    return Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(20.w, 50.w, 20.w, 0),
        child: RefreshIndicator(
          onRefresh: () async {
            _controller.getEveryHairStyles();
            print('refreshed');
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
              SizedBox(height: 15.w),
              HomeSearchBtn(
                onTap: () {
                  _idxController.changeTabIndex(1);
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

              SizedBox(height: 30.w),
              //Images
              Obx(
                () => Wrap(
                  spacing: 10.w,
                  runSpacing: 10.w,
                  children: _controller.recentHairs.value
                      .map((e) => GestureDetector(
                            onTap: () {
                              Get.to(() => DetailPage(hairStyle: e));
                            },
                            child: RecentHairStyle(
                              url: e.images[0],
                            ),
                          ))
                      .toList(),
                ),
              ),
              SizedBox(height: 100.w),
            ],
          ),
        ));
  }
}

class RecentHairStyle extends StatelessWidget {
  const RecentHairStyle({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      child: Container(
          width: 180.w,
          height: 180.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              url,
              fit: BoxFit.fill,
            ),
          )),
    );
  }
}

// TODO: Home Banner position
// TODO: Images
