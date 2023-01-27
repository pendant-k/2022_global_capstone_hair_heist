import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hair_heist/app/config/app_theme.dart';
import 'package:hair_heist/app/routes/app_pages.dart';
import 'package:hair_heist/app/ui/splash/splash.dart';

import 'firebase_options.dart';

void main() async {
  // Device 가로모드 방지
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase init
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          return GestureDetector(
            onTap: () {
              // keyboard dismiss
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                currentFocus.focusedChild!.unfocus();
              }
            },
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              getPages: AppPages.pages,
              // first page to render
              home: SplashPage(),
              // initialRoute: Routes.SPLASH,
              theme: AppTheme.globalTheme,
            ),
          );
        });
  }
}

// TODO: Touch -> dismiss keyboard