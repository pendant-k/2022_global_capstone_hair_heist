import 'dart:convert';

class User {
  // Unique id for each user
  final String uuid;
  // User nickname
  final String name;
  final String email;
  final String password;
  // check is designer or not (flag)
  final String role;
  // url to firebase storage
  final String? profileImgUrl;
  final bool isVerified;
  final String? licenseImgUrl;
  final String? introduce;
  User({
    required this.uuid,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    this.profileImgUrl,
    required this.isVerified,
    this.licenseImgUrl,
    this.introduce,
  });

  User copyWith({
    String? uuid,
    String? name,
    String? email,
    String? password,
    String? role,
    String? profileImgUrl,
    bool? isVerified,
    String? licenseImgUrl,
    String? introduce,
  }) {
    return User(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
      profileImgUrl: profileImgUrl ?? this.profileImgUrl,
      isVerified: isVerified ?? this.isVerified,
      licenseImgUrl: licenseImgUrl ?? this.licenseImgUrl,
      introduce: introduce ?? this.introduce,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'name': name,
      'email': email,
      'password': password,
      'role': role,
      'profileImgUrl': profileImgUrl,
      'isVerified': isVerified,
      'licenseImgUrl': licenseImgUrl,
      'introduce': introduce,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uuid: map['uuid'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      role: map['role'] as String,
      profileImgUrl:
          map['profileImgUrl'] != null ? map['profileImgUrl'] as String : null,
      isVerified: map['isVerified'] as bool,
      licenseImgUrl:
          map['licenseImgUrl'] != null ? map['licenseImgUrl'] as String : null,
      introduce: map['introduce'] != null ? map['introduce'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(uuid: $uuid, name: $name, email: $email, password: $password, role: $role, profileImgUrl: $profileImgUrl, isVerified: $isVerified, licenseImgUrl: $licenseImgUrl, introduce: $introduce)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.uuid == uuid &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.role == role &&
        other.profileImgUrl == profileImgUrl &&
        other.isVerified == isVerified &&
        other.licenseImgUrl == licenseImgUrl &&
        other.introduce == introduce;
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
        name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        role.hashCode ^
        profileImgUrl.hashCode ^
        isVerified.hashCode ^
        licenseImgUrl.hashCode ^
        introduce.hashCode;
  }
}
