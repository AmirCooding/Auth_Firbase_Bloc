part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpWithEmailAndPassword extends AuthEvent {
  final AuthEntity auth;
  const SignUpWithEmailAndPassword(this.auth);
  @override
  List<Object> get props => [auth];
}

class IsEmailAlreadyRegisteredEvent extends AuthEvent {
  final String email;
  const IsEmailAlreadyRegisteredEvent({required this.email});
  @override
  List<Object> get props => [email];
}

class CheckPasswordStrength extends AuthEvent {
  final String password;
  const CheckPasswordStrength({required this.password});
  @override
  List<Object> get props => [password];
}

class SignInWithEmailAndPassword extends AuthEvent {
  final AuthEntity auth;
  const SignInWithEmailAndPassword(this.auth);
  @override
  List<Object> get props => [auth];
}

class SignOut extends AuthEvent {}
