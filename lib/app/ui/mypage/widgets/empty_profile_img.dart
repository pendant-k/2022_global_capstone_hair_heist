import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/palette.dart';

class EmptyProfileImg extends StatelessWidget {
  const EmptyProfileImg({
    Key? key,
    this.size,
  }) : super(key: key);
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 75.w,
      height: size ?? 75.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Palette.grayE8,
      ),
      child: Icon(
        Icons.person,
        size: 50.w,
      ),
    );
  }
}
