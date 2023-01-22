import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/palette.dart';

class HomeSearchBtn extends StatelessWidget {
  const HomeSearchBtn({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.black.withOpacity(0.5),
      elevation: 5,
      borderRadius: BorderRadius.circular(15.w),
      color: Colors.grey[300],
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 60.w,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.search,
                size: 25.w,
                color: Palette.mainColor,
              ),
              SizedBox(width: 15.w),
              Text('Search now')
            ],
          ),
        ),
      ),
    );
  }
}
