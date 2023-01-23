// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String nickName;
  final String userId;
  final String email;
  User({
    required this.nickName,
    required this.userId,
    required this.email,
  });

  User copyWith({
    String? nickName,
    String? userId,
    String? email,
  }) {
    return User(
      nickName: nickName ?? this.nickName,
      userId: userId ?? this.userId,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nickName': nickName,
      'userId': userId,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      nickName: map['nickName'] as String,
      userId: map['userId'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'User(nickName: $nickName, userId: $userId, email: $email)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.nickName == nickName &&
        other.userId == userId &&
        other.email == email;
  }

  @override
  int get hashCode => nickName.hashCode ^ userId.hashCode ^ email.hashCode;
}
