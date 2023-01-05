import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hair_heist/app/routes/app_pages.dart';

void main() async {
  // Storage initialize
  // Storage <- Store user session(Json Web Token)
  await GetStorage.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    getPages: AppPages.pages,
    // first page to render
    initialRoute: Routes.SPLASH,
    // theme: appThemeData,
  ));
}
