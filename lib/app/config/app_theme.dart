import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hair_heist/app/config/global_styles.dart';
import 'package:hair_heist/app/config/palette.dart';
import 'package:hair_heist/app/utils/create_colors.dart';

class AppTheme {
  static final globalTheme = ThemeData(
    primaryColor: Palette.mainColor,
    primarySwatch: CreateColors.generateMaterialColor(Palette.mainColor),
    scaffoldBackgroundColor: Palette.backgroundColor,
    hintColor: Palette.fontSecondaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 20.w),
      alignment: Alignment.center,
      textStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.w),
      ),
    )),
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.only(
          top: 20.w,
          bottom: 20.w,
          left: 15.w,
          right: 15.w,
        ),
        hintStyle: GlobalStyle.primaryText.copyWith(
          color: Palette.fontSecondaryColor,
          fontSize: 16.sp,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Palette.grayE8,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Palette.mainColor,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        errorStyle: GlobalStyle.primaryText.copyWith(
          fontSize: 13.sp,
          color: Colors.red,
        )),
  );
}
