part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthLoading extends AuthState {}

final class IsEmailAlreadyRegistrated extends AuthState {}

final class IsEmailAlreadyNotRegistrated extends AuthState {}

final class PasswordIsCorrect extends AuthState {}

final class SignUpSuccess extends AuthState {}

final class SignInSuccess extends AuthState {}

final class AuthFailure extends AuthState {
  final String message;
  const AuthFailure(this.message);
  @override
  List<Object> get props => [message];
}

final class SignOutSuccess extends AuthState {}
