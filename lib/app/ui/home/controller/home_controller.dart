import 'package:get/get.dart';
import 'package:hair_heist/app/data/repository/hairstyle_repository.dart';

import '../../../data/model/hairstyle.dart';

class HomeController extends GetxController {
  final HairStylesRepository repository;
  HomeController(this.repository);

  @override
  void onInit() {
    super.onInit();
    getEveryHairStyles();
  }

  final recentHairs = Rx<List<HairStyle>>([]);

  getEveryHairStyles() async {
    final result = await repository.getRecentHairStyles();
    recentHairs.value = result;
  }
}
