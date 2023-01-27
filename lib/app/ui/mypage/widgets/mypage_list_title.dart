import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/global_styles.dart';

class MyPageListTitle extends StatelessWidget {
  const MyPageListTitle({
    Key? key,
    required this.data,
  }) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GlobalStyle.primaryText.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 24.sp,
      ),
    );
  }
}
