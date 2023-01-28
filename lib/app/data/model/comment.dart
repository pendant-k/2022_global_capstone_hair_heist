// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Comment {
  final String uuid;
  final String hairId;
  final String ownerId;
  final String message;
  final int like;
  final int dislike;
  Comment({
    required this.uuid,
    required this.hairId,
    required this.ownerId,
    required this.message,
    required this.like,
    required this.dislike,
  });

  Comment copyWith({
    String? uuid,
    String? hairId,
    String? ownerId,
    String? message,
    int? like,
    int? dislike,
  }) {
    return Comment(
      uuid: uuid ?? this.uuid,
      hairId: hairId ?? this.hairId,
      ownerId: ownerId ?? this.ownerId,
      message: message ?? this.message,
      like: like ?? this.like,
      dislike: dislike ?? this.dislike,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'hairId': hairId,
      'ownerId': ownerId,
      'message': message,
      'like': like,
      'dislike': dislike,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      uuid: map['uuid'] as String,
      hairId: map['hairId'] as String,
      ownerId: map['ownerId'] as String,
      message: map['message'] as String,
      like: map['like'] as int,
      dislike: map['dislike'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Comment(uuid: $uuid, hairId: $hairId, ownerId: $ownerId, message: $message, like: $like, dislike: $dislike)';
  }

  @override
  bool operator ==(covariant Comment other) {
    if (identical(this, other)) return true;

    return other.uuid == uuid &&
        other.hairId == hairId &&
        other.ownerId == ownerId &&
        other.message == message &&
        other.like == like &&
        other.dislike == dislike;
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
        hairId.hashCode ^
        ownerId.hashCode ^
        message.hashCode ^
        like.hashCode ^
        dislike.hashCode;
  }
}
