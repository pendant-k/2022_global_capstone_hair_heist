// packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// config
import 'package:hair_heist/app/config/palette.dart';

// controllers
import 'package:hair_heist/app/controller/main_nav_idx_controller.dart';
import 'package:hair_heist/app/ui/home/view/home_page.dart';
import 'package:hair_heist/app/ui/mypage/view/my_page.dart';

class MainNavigationPage extends StatelessWidget {
  MainNavigationPage({super.key});

  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  @override
  Widget build(BuildContext context) {
    // dependency injection - Home Index State
    final _controller = Get.put(MainNavIndexController());
    final _mainPages = [HomePage(), MyPage(), MyPage(), MyPage()];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.backgroundColor,
        bottomNavigationBar: Obx(
          () => SizedBox(
            height: 80.w,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              showSelectedLabels: false,
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
                    child: Icon(
                      Icons.home,
                      size: 20.w,
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    child: Icon(
                      Icons.search,
                      size: 20.w,
                    ),
                  ),
                  label: 'Search',
                  backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    child: Icon(
                      Icons.favorite,
                      size: 20.w,
                    ),
                  ),
                  label: 'Favorites',
                  backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    child: Icon(
                      Icons.person,
                      size: 20.w,
                    ),
                  ),
                  label: 'My Profile',
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
        body: Obx(() => _mainPages[_controller.pageIdx.value]),
      ),
    );
  }
}
