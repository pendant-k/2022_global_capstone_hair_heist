import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hair_heist/app/data/model/user.dart';
import 'package:hair_heist/app/data/repository/authentication.dart';
import 'package:hair_heist/app/data/repository/user_data_repository.dart';
import 'package:hair_heist/app/ui/global_widgets/app_alert.dart';
import 'package:hair_heist/app/ui/splash/splash.dart';

class MyPageController extends GetxController {
  late final AuthRepository authRepo;
  late final UserDataRepository userDataRepo;

  @override
  void onInit() {
    authRepo = AuthRepository(auth: FirebaseAuth.instance);
    userDataRepo = UserDataRepository(dio: Dio());
    fetchUserData();
    super.onInit();
  }

  Rx<UserData?> userData = Rx<UserData?>(null);

  fetchUserData() async {
    try {
      var _mock = await userDataRepo.getUserMock();
      // var _result = await userDataRepo.getUserByUid(authRepo.currentUser!.uid);
      // update value from server to userData Rx value
      // userData(_result);
      userData(_mock);
    } catch (e) {
      throw Exception(e);
    }
  }

  signOut() async {
    Get.dialog(
      AppAlertDialog(
        onTap: () async {
          try {
            await authRepo.signOut();
            Get.offAll(() => SplashPage());
            Get.snackbar('Sign Out', 'Sign out correctly');
          } catch (e) {
            throw Exception(e);
          }
        },
        title: 'Log out',
        content: 'Are you sure to log-out?',
      ),
    );
  }
}
