import 'package:dio/dio.dart';
import 'package:hair_heist/app/config/urls.dart';
import 'package:hair_heist/app/data/model/sign_up.dart';
import 'package:hair_heist/app/data/model/user.dart';

class UserDataRepository {
  final Dio dio;
  UserDataRepository({
    required this.dio,
  });

  final _url = '${Urls.BASEURL}/users';

  Future<void> createNewUserData(SignUpForm signUpForm) async {
    try {
      final _formData = FormData.fromMap(signUpForm.toMap());
      final _result = await dio.post(
        _url,
        data: _formData,
      );
      print(_result.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
