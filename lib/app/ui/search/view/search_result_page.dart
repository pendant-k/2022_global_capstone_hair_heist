import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hair_heist/app/ui/detail/view/detail_page.dart';

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
                TextField(
                  autocorrect: false,
                  style: GlobalStyle.inputText,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.w,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 25.w,
                    ),
                    hintText: 'Search by keyword',
                  ),
                  onSubmitted: (value) {
                    print(value);
                  },
                ),
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
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.5,
                      mainAxisSpacing: 10.w,
                      crossAxisSpacing: 10.w,
                    ),
                    itemBuilder: (context, idx) => ResultItem(),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class ResultItem extends StatelessWidget {
  const ResultItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get to detail page with hairstyle model
        Get.to(() => DetailPage());
      },
      child: Material(
        color: Colors.white,
        elevation: 3,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 180.w,
                child: Image.asset(
                  'assets/images/dummy_img.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 10.w),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'hair style name',
                      style: GlobalStyle.primaryText.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                    ),
                    Text(
                      'designer',
                      style: GlobalStyle.secondaryText,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
