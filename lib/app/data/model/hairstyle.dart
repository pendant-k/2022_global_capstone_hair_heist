import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hair_heist/app/data/model/user.dart';

class HairStyle {
  final UserData designerData;
  final String hairId;
  final String name;
  final String desc;
  final String? modelEmail;
  final List<String> images;
  final List<String> keywords;

  HairStyle({
    required this.designerData,
    required this.hairId,
    required this.name,
    required this.desc,
    this.modelEmail,
    required this.images,
    required this.keywords,
  });

  HairStyle copyWith({
    UserData? designerData,
    String? hairId,
    String? name,
    String? desc,
    String? modelEmail,
    List<String>? images,
    List<String>? keywords,
  }) {
    return HairStyle(
        designerData: designerData ?? this.designerData,
        hairId: hairId ?? this.hairId,
        name: name ?? this.name,
        desc: desc ?? this.desc,
        modelEmail: modelEmail ?? this.modelEmail,
        images: images ?? this.images,
        keywords: keywords ?? this.keywords);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'designerData': designerData.toMap(),
      'hairId': hairId,
      'name': name,
      'desc': desc,
      'modelEmail': modelEmail,
      'images': images,
      'keywords': keywords,
    };
  }

  factory HairStyle.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    return HairStyle(
      designerData: UserData.fromMap(doc.data()!['designerData']),
      hairId: doc.data()!['hairId'],
      name: doc.data()!['name'],
      desc: doc.data()!['desc'],
      images: List<String>.from(doc.data()!['images']),
      keywords: List<String>.from(doc.data()!['keywords']),
    );
  }

  factory HairStyle.fromMap(Map<String, dynamic> map) {
    return HairStyle(
        designerData:
            UserData.fromMap(map['designerData'] as Map<String, dynamic>),
        hairId: map['hairId'] as String,
        name: map['name'] as String,
        desc: map['desc'] as String,
        modelEmail:
            map['modelEmail'] != null ? map['modelEmail'] as String : null,
        images: List<String>.from(
          (map['images'] as List<String>),
        ),
        keywords: List<String>.from(map['keywords'] as List<String>));
  }

  String toJson() => json.encode(toMap());

  factory HairStyle.fromJson(String source) =>
      HairStyle.fromMap(json.decode(source) as Map<String, dynamic>);
}
