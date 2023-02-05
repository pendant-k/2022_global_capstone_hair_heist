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

  Future<UserData> getUserByUid(String uid) async {
    try {
      final _response = await dio.get(_url + '/$uid');
      print(_response.data.toString());
      final _userData = UserData.fromJson(_response.data.toString());
      return _userData;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UserData> getUserMock() async {
    try {
      final _result = await Future.delayed(Duration(milliseconds: 1000), () {
        return UserData(
            uuid: 'uuid-test',
            name: 'Mock User',
            email: 'mock@domain.com',
            password: 'password',
            role: 'user',
            isVerified: false);
      });
      return _result;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateProfileImageUrlByUid(String url, String uid) async {
    try {
      final _formData = FormData.fromMap({"url": url, "uid": uid});
      final _result = await dio.post(
        _url + 'up',
        data: _formData,
      );
      print(_result.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateLicenseImageUrlByUid(String url, String uid) async {
    try {
      final _formData = FormData.fromMap({"url": url, "uid": uid});
      final _result = await dio.post(
        _url + 'upli',
        data: _formData,
      );
      print(_result.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateUserDataByUid(UserData userData) async {
    try {
      final _formData = FormData.fromMap({
        "name": userData.name,
        "email": userData.email,
        "password": userData.password,
        "role": userData.role,
        "uid": userData.uuid,
      });
      final _result = await dio.post(_url, data: _formData);
      print(_result.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
