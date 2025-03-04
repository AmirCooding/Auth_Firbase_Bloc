import 'package:auth/auth_feauter/domain/entity/auth_enity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({required super.email, required super.password});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json['email'] ?? "",
      password: json['password'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
    };
  }
}
