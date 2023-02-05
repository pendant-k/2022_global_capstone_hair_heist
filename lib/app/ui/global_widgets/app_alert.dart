import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/global_styles.dart';

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({
    super.key,
    required this.onTap,
    required this.title,
    required this.content,
  });
  final VoidCallback onTap;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 20.w, left: 20.w, right: 20.w),
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.w),
      titlePadding: EdgeInsets.only(left: 20.w, top: 20.w),
      buttonPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: GlobalStyle.primaryText.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      content: Text(
        content,
        style: GlobalStyle.primaryText,
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.w),
            ),
            onPressed: onTap,
            child: Text(
              'Yes',
              style: GlobalStyle.whiteText.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.w),
              backgroundColor: Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
            child: Text(
              'No',
              style: GlobalStyle.primaryText,
            ),
          ),
        )
      ],
    );
  }
}
