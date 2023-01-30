import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hair_heist/app/config/global_styles.dart';
import 'package:hair_heist/app/config/palette.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50.w),
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 10,
            left: 20.w,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 25.w,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 10.w,
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 15.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: double.infinity,
                  height: 300.w,
                  child: Image.asset(
                    'assets/images/dummy_img.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: DesignerCard(),
            ),
            SizedBox(
              height: 30.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                'Hair Name',
                style: GlobalStyle.primaryText.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                ),
              ),
            ),
            SizedBox(
              height: 28.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                'Description about this hair style from designer',
                style: GlobalStyle.primaryText,
              ),
            ),
            SizedBox(
              height: 28.w,
            ),
            CustomDivider(),
            SizedBox(
              height: 28.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Keywords',
                    style: GlobalStyle.primaryText.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(
                    height: 28.w,
                  ),
                  Wrap(
                    runSpacing: 5.w,
                    spacing: 5.w,
                    children: [
                      DetailKeywordChip(),
                      DetailKeywordChip(),
                      DetailKeywordChip(),
                      DetailKeywordChip(),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailKeywordChip extends StatelessWidget {
  const DetailKeywordChip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      side: BorderSide(
        color: Color(0xffdfdfdf),
      ),
      backgroundColor: Colors.white,
      label: Text('keyword'),
      padding: EdgeInsets.zero,
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 12.w,
      decoration: BoxDecoration(
          color: Color(0xFFF8F8F8),
          border: Border(
            top: BorderSide(
              color: Color(0xffdededf),
            ),
            bottom: BorderSide(
              color: Color(0xffdededf),
            ),
          )),
    );
  }
}

class DesignerCard extends StatelessWidget {
  const DesignerCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 5,
      child: Container(
        width: double.infinity,
        height: 80.w,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.w),
        decoration: BoxDecoration(
          color: Palette.mainColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 35,
            ),
            SizedBox(width: 20.w),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Designer name',
                  style: GlobalStyle.whiteText.copyWith(
                    color: Color(0xFFF8F8F8),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Hair shop name',
                  style: GlobalStyle.whiteText.copyWith(
                      color: Color(0xFFF8F8F8).withOpacity(0.7),
                      fontSize: 12.sp),
                ),
                Text(
                  'Address',
                  style: GlobalStyle.whiteText.copyWith(
                    color: Color(0xFFF8F8F8).withOpacity(0.7),
                    fontSize: 12.sp,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
