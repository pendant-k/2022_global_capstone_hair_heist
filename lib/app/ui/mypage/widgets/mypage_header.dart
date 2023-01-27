import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/global_styles.dart';
import '../../../config/palette.dart';

class MyPageHeader extends StatelessWidget {
  const MyPageHeader({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
              ),
              SizedBox(
                width: 20.sp,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nickname',
                    style: GlobalStyle.primaryText.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 24.sp,
                    ),
                  ),
                  Text(
                    'email@domain.com',
                    style: GlobalStyle.secondaryText.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.keyboard_arrow_right,
            size: 36.w,
            color: Palette.grayDF,
          ),
        ],
      ),
    );
  }
}
