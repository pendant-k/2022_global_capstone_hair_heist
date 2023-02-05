import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hair_heist/app/data/model/user.dart';

import '../../../config/global_styles.dart';
import '../../../config/palette.dart';

// widget
import 'empty_profile_img.dart';

class MyPageHeader extends StatelessWidget {
  const MyPageHeader({
    Key? key,
    required this.onTap,
    required this.userData,
  }) : super(key: key);
  final VoidCallback onTap;
  final UserData userData;

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
              userData.profileImgUrl == null ? EmptyProfileImg() : Container(),
              SizedBox(
                width: 20.sp,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userData.name,
                    style: GlobalStyle.primaryText.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 24.sp,
                    ),
                  ),
                  Text(
                    userData.email,
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
