import 'package:equatable/equatable.dart';

class AuthEnity extends Equatable {
  final String id;
  final String email;
  final String? password;

  const AuthEnity({
    required this.id,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [id, email, password];
}
