import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hair_heist/app/config/palette.dart';

import '../../../config/global_styles.dart';

class MyPageItem extends StatelessWidget {
  const MyPageItem({
    Key? key,
    required this.icon,
    required this.itemLabel,
    required this.onTap,
  }) : super(key: key);
  final String itemLabel;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.w),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30.w,
            ),
            SizedBox(
              width: 30.w,
            ),
            Text(
              itemLabel,
              style: GlobalStyle.primaryText.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
