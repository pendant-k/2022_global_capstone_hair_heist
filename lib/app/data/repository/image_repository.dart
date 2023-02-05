import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ImageRepository {
  final ImagePicker _picker = ImagePicker();
  final _storage = FirebaseStorage.instance;

  Future<String?> getImageFromGallery() async {
    final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);
    if (_image == null) {
      return null;
    } else {
      return _image.path;
    }
  }

  Future<String?> getImageFromCamera() async {
    final XFile? _image = await _picker.pickImage(source: ImageSource.camera);
    if (_image == null) {
      return null;
    } else {
      print(_image.path);
      return _image.path;
    }
  }

  Future<String> uploadProfileToStorageByUid(
      String uid, String selectedImgPath) async {
    final _file = File(selectedImgPath);
    final _destination = 'profile/$uid.png';
    try {
      final ref = _storage.ref(_destination);
      await ref.putFile(_file);
      final _downloadUrl = await ref.getDownloadURL();
      return _downloadUrl;
    } catch (e) {
      throw Exception(e);
    }
  }
}
