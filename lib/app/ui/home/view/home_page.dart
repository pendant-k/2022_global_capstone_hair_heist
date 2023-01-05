import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hair_heist/app/config/palette.dart';

import 'package:hair_heist/app/controller/home_index_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  @override
  Widget build(BuildContext context) {
    // dependency injection
    final _controller = Get.put(HomeIndexController());

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => SizedBox(
            height: 80.w,
            child: BottomNavigationBar(
              showUnselectedLabels: true,
              showSelectedLabels: true,
              onTap: (idx) {
                _controller.changeTabIndex(idx);
              },
              currentIndex: _controller.pageIdx.value,
              backgroundColor: Colors.white,
              unselectedItemColor: Colors.black.withOpacity(0.5),
              selectedItemColor: Palette.mainColor,
              unselectedLabelStyle: unselectedLabelStyle,
              selectedLabelStyle: selectedLabelStyle,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 7),
                    child: Icon(
                      Icons.home,
                      size: 20.w,
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 7),
                    child: Icon(
                      Icons.search,
                      size: 20.0,
                    ),
                  ),
                  label: 'Explore',
                  backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 7),
                    child: Icon(
                      Icons.location_history,
                      size: 20.w,
                    ),
                  ),
                  label: 'Places',
                  backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 7),
                    child: Icon(
                      Icons.settings,
                      size: 20.w,
                    ),
                  ),
                  label: 'Settings',
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
