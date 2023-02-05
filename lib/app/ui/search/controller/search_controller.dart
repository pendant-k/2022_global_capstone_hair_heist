import 'package:get/get.dart';
import 'package:hair_heist/app/data/model/hairstyle.dart';
import 'package:hair_heist/app/data/repository/hairstyle_repository.dart';

class SearchController extends GetxController {
  final HairStylesRepository repository;
  SearchController(this.repository);

  var searchKeyword = "".obs;
  var resultList = Rx<List<HairStyle>>([]);

  updateSearchKeyword(String value) async {
    searchKeyword.value = value;
    final _result = await repository.getHairStyleByKeyword(value);
    resultList.value = _result;
  }

  getResult() async {
    final _result = await repository.getHairStyleByKeyword(searchKeyword.value);
    resultList.value = _result;
  }
}
