// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hair_heist/app/data/model/hairstyle.dart';
import 'package:http/http.dart' as http;

// base Url -> server uri
var baseUrl = 'http://localhost:5000/hairstyle';

class HairStylesRepository {
  final http.Client httpClient;

  HairStylesRepository({
    required this.httpClient,
  });

  // Get one hair style data
  Future<HairStyle?> getHairStyleByUid(String uid) async {
    try {
      final _response = await httpClient.get(Uri.parse(baseUrl + '/$uid'));
      if (_response.statusCode == 200) {
        final _hairstyle = HairStyle.fromJson(_response.body);
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
      final _response =
          await httpClient.post(Uri.parse(baseUrl + 'bykey'), body: {
        'keys': keyword,
      });
      if (_response.statusCode == 200) {
        final _hairstyle = HairStyle.fromJson(_response.body);
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
