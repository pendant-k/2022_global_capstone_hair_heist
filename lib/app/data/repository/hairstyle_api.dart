// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:hair_heist/app/data/model/hairstyle.dart';

// base Url -> server uri
var baseUrl = 'http://localhost:5000/hairstyle';

class HairStylesRepository {
  final Dio dio;

  HairStylesRepository({
    required this.dio,
  });

  // Get one hair style data
  Future<HairStyle?> getHairStyleByUid(String uid) async {
    try {
      final _response = await dio.get(baseUrl + '/$uid');
      if (_response.statusCode == 200) {
        final _hairstyle = HairStyle.fromJson(_response.data);
        return _hairstyle;
      } else {
        print('Cannot get hairstyle correctly');
        return null;
      }
    } catch (_) {
      throw Exception('Cannot Get HairStyle by Uid');
    }
  }

  Future<HairStyle?> getHairStyleByKeyword(String keyword) async {
    try {
      final _response = await dio.post(baseUrl + 'bykey', data: {
        'keys': keyword,
      });
      if (_response.statusCode == 200) {
        final _hairstyle = HairStyle.fromJson(_response.data);
        return _hairstyle;
      } else {
        print('Cannot get hairstyle correctly');
        return null;
      }
    } catch (_) {
      throw Exception('Cannot Get HairStyle by Uid');
    }
  }
}
