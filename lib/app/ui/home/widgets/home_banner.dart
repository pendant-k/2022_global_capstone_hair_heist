import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/palette.dart';
import '../../../config/global_styles.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Palette.mainColor,
        borderRadius: BorderRadius.circular(15.w),
      ),
      child: Text(
        'Welcome to hair heist',
        style: GlobalStyle.whiteText.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
