import 'package:get/get.dart';

class MainNavIndexController extends GetxController {
  var pageIdx = 0.obs;

  void changeTabIndex(int index) {
    pageIdx.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
