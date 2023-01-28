// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HairStyle {
  final String uuid;
  final String name;
  final String url1;
  final String url2;
  final String? url3;
  final String? url4;
  final String designerId;
  final String? modelId;
  final int like;
  final int dislike;
  HairStyle({
    required this.uuid,
    required this.name,
    required this.url1,
    required this.url2,
    this.url3,
    this.url4,
    required this.designerId,
    this.modelId,
    required this.like,
    required this.dislike,
  });

  HairStyle copyWith({
    String? uuid,
    String? name,
    String? url1,
    String? url2,
    String? url3,
    String? url4,
    String? designerId,
    String? modelId,
    int? like,
    int? dislike,
  }) {
    return HairStyle(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      url1: url1 ?? this.url1,
      url2: url2 ?? this.url2,
      url3: url3 ?? this.url3,
      url4: url4 ?? this.url4,
      designerId: designerId ?? this.designerId,
      modelId: modelId ?? this.modelId,
      like: like ?? this.like,
      dislike: dislike ?? this.dislike,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'name': name,
      'url1': url1,
      'url2': url2,
      'url3': url3,
      'url4': url4,
      'designerId': designerId,
      'modelId': modelId,
      'like': like,
      'dislike': dislike,
    };
  }

  factory HairStyle.fromMap(Map<String, dynamic> map) {
    return HairStyle(
      uuid: map['uuid'] as String,
      name: map['name'] as String,
      url1: map['url1'] as String,
      url2: map['url2'] as String,
      url3: map['url3'] != null ? map['url3'] as String : null,
      url4: map['url4'] != null ? map['url4'] as String : null,
      designerId: map['designerId'] as String,
      modelId: map['modelId'] != null ? map['modelId'] as String : null,
      like: map['like'] as int,
      dislike: map['dislike'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory HairStyle.fromJson(String source) =>
      HairStyle.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HairStyle(uuid: $uuid, name: $name, url1: $url1, url2: $url2, url3: $url3, url4: $url4, designerId: $designerId, modelId: $modelId, like: $like, dislike: $dislike)';
  }

  @override
  bool operator ==(covariant HairStyle other) {
    if (identical(this, other)) return true;

    return other.uuid == uuid &&
        other.name == name &&
        other.url1 == url1 &&
        other.url2 == url2 &&
        other.url3 == url3 &&
        other.url4 == url4 &&
        other.designerId == designerId &&
        other.modelId == modelId &&
        other.like == like &&
        other.dislike == dislike;
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
        name.hashCode ^
        url1.hashCode ^
        url2.hashCode ^
        url3.hashCode ^
        url4.hashCode ^
        designerId.hashCode ^
        modelId.hashCode ^
        like.hashCode ^
        dislike.hashCode;
  }
}
