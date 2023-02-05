import 'package:get/get.dart';
import 'package:hair_heist/app/data/model/user.dart';
import 'package:hair_heist/app/data/repository/authentication.dart';
import 'package:hair_heist/app/data/repository/image_repository.dart';
import 'package:hair_heist/app/data/repository/user_data_repository.dart';
import 'package:hair_heist/app/ui/global_widgets/global_widgets.dart';

class EditProfileController extends GetxController {
  // add image repository
  final UserDataRepository userDataRepository;
  final ImageRepository imageRepository;
  final AuthRepository authRepository;
  final UserData userData;

  EditProfileController({
    required this.userData,
    required this.userDataRepository,
    required this.imageRepository,
    required this.authRepository,
  });

  final name = "".obs;
  final isVisible = false.obs;
  final password = "".obs;
  final confirmPassword = "".obs;
  final selectedImg = "".obs;

  @override
  void onInit() {
    super.onInit();
    name.value = userData.name;
    password.value = userData.password;
    confirmPassword.value = userData.password;
  }

  void updateProfileImg() async {
    final _selectedPath = await imageRepository.getImageFromGallery();
    if (_selectedPath != null) {
      selectedImg.value = _selectedPath;
    }
  }

  void updateName(String value) {
    name.value = value;
  }

  void updatePassword(String value) {
    password.value = value;
  }

  void updateConfirmPassword(String value) {
    confirmPassword.value = value;
  }

  void updateUserData() {
    Get.dialog(
      AppAlertDialog(
          onTap: () async {
            if (selectedImg.value != "") {
              final _url = await imageRepository.uploadProfileToStorageByUid(
                  authRepository.currentUser!.uid, selectedImg.value);

              await userDataRepository.updateProfileImageUrlByUid(
                  _url, authRepository.currentUser!.uid);
            }

            final _userData = UserData(
              uuid: userData.uuid,
              name: name.value,
              email: userData.email,
              password: password.value,
              role: userData.role,
              isVerified: userData.isVerified,
            );
            await userDataRepository.updateUserDataByUid(_userData);
            Get.back(closeOverlays: true);
          },
          title: 'Update',
          content: 'Are you sure to update your user data?'),
    );
  }
}
