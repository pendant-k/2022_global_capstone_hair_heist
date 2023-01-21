import 'package:get/route_manager.dart';
import 'package:hair_heist/app/ui/main_navigation/main_nav_page.dart';
import 'package:hair_heist/app/ui/splash/splash.dart';
part './app_routes.dart';

class AppPages {
  // use static keyword, we don't have to create instance
  static final pages = [
    // GetPage
    // name -> from Routes
    // page -> from ui directory, each feature file
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.MAINNAVIGATION,
      page: () => MainNavigationPage(),
    ),
  ];
}
