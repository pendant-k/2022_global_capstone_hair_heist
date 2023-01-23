import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hair_heist/app/config/palette.dart';

// Global Styling static values
class GlobalStyle {
  // text styles
  static final primaryText = TextStyle(
    // fontFamily: 'NotoSans',
    color: Palette.fontPrimaryColor,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );

  static final secondaryText = TextStyle(
    color: Palette.fontSecondaryColor,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );

  static final whiteText = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );

  static final inputText = TextStyle(
    color: Palette.fontPrimaryColor,
    fontSize: 16.sp,
  );
}
