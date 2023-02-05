import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hair_heist/app/data/model/hairstyle.dart';
import 'package:hair_heist/app/ui/search/controller/search_controller.dart';

import '../../../config/global_styles.dart';
import '../../detail/view/detail_page.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchController>();
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
                Obx(() => TextFormField(
                      initialValue: controller.searchKeyword.value,
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
                      onFieldSubmitted: (value) {
                        controller.updateSearchKeyword(value.trim());
                      },
                    )),
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
                    controller.getResult();
                    print('refresh search result list');
                  },
                  child: GridView.builder(
                    itemCount: controller.resultList.value.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.5,
                      mainAxisSpacing: 10.w,
                      crossAxisSpacing: 10.w,
                    ),
                    itemBuilder: (context, idx) => ResultItem(
                      hairStyle: controller.resultList.value[idx],
                    ),
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
    required this.hairStyle,
  }) : super(key: key);

  final HairStyle hairStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get to detail page with hairstyle model
        Get.to(() => DetailPage(
              hairStyle: hairStyle,
            ));
      },
      child: Material(
        color: Colors.white,
        elevation: 3,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 180.w,
                child: Image.network(
                  hairStyle.images[0],
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 10.w),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hairStyle.name,
                          style: GlobalStyle.primaryText.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Text(
                          hairStyle.desc,
                          style: GlobalStyle.secondaryText
                              .copyWith(fontSize: 12.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Text(
                      'designed by ${hairStyle.designerData.name}',
                      style: GlobalStyle.primaryText.copyWith(
                        fontSize: 11.sp,
                      ),
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
