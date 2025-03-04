import 'dart:developer';

import 'package:auth/auth_feauter/data/model/auth_model.dart';
import 'package:auth/auth_feauter/domain/entity/auth_enity.dart';
import 'package:auth/auth_feauter/domain/usecase/auth_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsecase usecase;
  AuthBloc(this.usecase) : super(AuthLoading()) {
    on<IsEmailAlreadyRegisteredEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final isEmailRegistered =
            await usecase.isEmailAlreadyRegistered(event.email);
        if (isEmailRegistered) {
          emit(IsEmailAlreadyRegistrated());
        } else {
          emit(IsEmailAlreadyNotRegistrated());
        }
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<CheckPasswordStrength>((event, emit) {
      emit(AuthLoading());
      if (usecase.isValidPassword(event.password)) {
        emit(PasswordIsCorrect());
      } else {
        emit(AuthFailure("Password is not strong enough"));
      }
    });
    on<SignUpWithEmailAndPassword>((event, emit) async {
      emit(AuthLoading());
      try {
        await usecase.signUpWithEmailAndPassword(event.auth);
        emit(SignUpSuccess());
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<SignInWithEmailAndPassword>((event, emit) async {
      emit(AuthLoading());
      try {
        await usecase.signInWithEmailAndPassword(event.auth);
        emit(SignInSuccess());
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<SignOut>((event, emit) {
      emit(AuthLoading());
      usecase.signOut().then((value) {
        emit(AuthLoading());
      }).catchError((e) {
        emit(AuthFailure(e.toString()));
      });
    });
  }
}
