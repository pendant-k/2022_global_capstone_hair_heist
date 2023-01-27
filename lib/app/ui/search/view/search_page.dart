import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// configs
import 'package:hair_heist/app/config/palette.dart';
import 'package:hair_heist/app/config/global_styles.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(20.w, 39.w, 20.w, 0),
        child: ListView(
          children: [
            SizedBox(
              height: 42.w,
            ),
            Material(
              color: Colors.white,
              elevation: 10,
              shadowColor: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15.w),
              child: TextField(
                autocorrect: false,
                autofocus: true,
                style: GlobalStyle.inputText,
                decoration: InputDecoration(
                  hintText: 'Search by keyword',
                ),
              ),
            ),
            SizedBox(
              height: 20.w,
            ),
            Text(
              'Recents',
              style: GlobalStyle.primaryText.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 24.sp,
              ),
            ),
            SizedBox(
              height: 20.w,
            ),
            // Get previous keywords -> Get storage?
            Wrap(
              spacing: 10.w, // gap between adjacent chips
              runSpacing: 10.w,
              children: [
                Chip(
                  backgroundColor: Colors.white,
                  side: BorderSide(
                    color: Palette.grayE8,
                    width: 1.5,
                  ),
                  label: Text(
                    'recent keyword',
                    style: GlobalStyle.primaryText,
                  ),
                  onDeleted: () {
                    print('delete this!');
                  },
                  deleteIcon: Icon(
                    Icons.cancel_outlined,
                    size: 20.w,
                  ),
                ),
              ],
            ),
            SizedBox(height: 100.w),
          ],
        ),
      ),
    );
  }
}

// TODO: Home Banner position
// TODO: Hint text 내용 수정 