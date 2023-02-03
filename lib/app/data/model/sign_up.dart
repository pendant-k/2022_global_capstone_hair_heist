// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignUpForm {
  final String name;
  final String email;
  final String password;
  final String confPassword;
  final String role;
  final String uid;

  SignUpForm({
    required this.name,
    required this.email,
    required this.password,
    required this.confPassword,
    required this.role,
    required this.uid,
  });

  SignUpForm copyWith({
    String? name,
    String? email,
    String? password,
    String? confPassword,
    String? role,
    String? uid,
  }) {
    return SignUpForm(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confPassword: confPassword ?? this.confPassword,
      role: role ?? this.role,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'confPassword': confPassword,
      'role': role,
      'uid': uid,
    };
  }

  factory SignUpForm.fromMap(Map<String, dynamic> map) {
    return SignUpForm(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      confPassword: map['confPassword'] as String,
      role: map['role'] as String,
      uid: map['uid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpForm.fromJson(String source) =>
      SignUpForm.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SignUpForm(name: $name, email: $email, password: $password, confPassword: $confPassword, role: $role, uid: $uid)';
  }

  @override
  bool operator ==(covariant SignUpForm other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.password == password &&
        other.confPassword == confPassword &&
        other.role == role &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        confPassword.hashCode ^
        role.hashCode ^
        uid.hashCode;
  }
}
