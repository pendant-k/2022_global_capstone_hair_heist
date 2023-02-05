import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hair_heist/app/data/model/hairstyle.dart';

// base Url -> server uri
var baseUrl = 'http://localhost:5000/hairstyle';

class HairStylesRepository {
  final FirebaseFirestore db;
  HairStylesRepository({
    required this.db,
  });

  Future<void> createNewHairStyle(HairStyle hairStyle) async {
    try {
      await db
          .collection('hairstyles')
          .doc(hairStyle.hairId)
          .set(hairStyle.toMap());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateHairStyleByHairId(
      String hairId, HairStyle hairStyle) async {
    try {
      await db.collection('hairstyles').doc(hairId).update(hairStyle.toMap());
    } catch (e) {
      throw Exception(e);
    }
  }

  // Get one hair style data
  Future<HairStyle?> getHairStyleByUid(String uid) async {
    try {
      final _result = await db.collection('hairstyles').doc(uid).get();
      return HairStyle.fromFirestore(_result);
    } catch (_) {
      throw Exception('Cannot Get HairStyle by Uid');
    }
  }

  Future<List<HairStyle>> getHairStyleByKeyword(String keyword) async {
    try {
      final _result = await db
          .collection('hairstyles')
          .where('keywords', arrayContains: keyword)
          .get();
      if (_result.docs.isEmpty) {
        return [];
      } else {
        return _result.docs.map((e) => HairStyle.fromFirestore(e)).toList();
      }
    } catch (_) {
      throw Exception('Cannot Get HairStyle by keywords');
    }
  }

  Future<List<HairStyle>> getRecentHairStyles() async {
    try {
      final _result = await db.collection('hairstyles').get();
      if (_result.docs.isEmpty) {
        return [];
      } else {
        return _result.docs.map((e) => HairStyle.fromFirestore(e)).toList();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
