import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../config/global_styles.dart';
import '../../../config/palette.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 120.w),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 20.w,
              left: 20.w,
              right: 20.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(height: 10.w),
                TextField(),
              ],
            ),
          ),
        ),
      ),
      body: Container(
          color: Colors.white,
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'result',
                style: GlobalStyle.primaryText.copyWith(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 15.w),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    print('refresh search result list');
                  },
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.5,
                      mainAxisSpacing: 10.w,
                      crossAxisSpacing: 10.w,
                    ),
                    itemBuilder: (context, idx) => Material(
                      elevation: 5,
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 180.w,
                              color: Colors.amber,
                            ),
                            SizedBox(height: 10.w),
                            Text('hair style name'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
