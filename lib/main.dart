import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hair_heist/app/routes/app_pages.dart';

void main() async {
  // Device 가로모드 방지
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Storage initialize
  // Storage <- Store user session(Json Web Token)
  await GetStorage.init();
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412, 892),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              getPages: AppPages.pages,
              // first page to render
              initialRoute: Routes.SPLASH,
              // theme: appThemeData,
            ),
          );
        });
  }
}
