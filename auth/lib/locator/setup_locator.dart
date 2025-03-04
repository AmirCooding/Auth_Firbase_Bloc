import 'package:auth/auth_feauter/data/remote/firbase_sarvice/firebase_auth_service.dart';
import 'package:auth/auth_feauter/data/repository/auth_repository_impl.dart';
import 'package:auth/auth_feauter/domain/repository/auth_repository.dart';
import 'package:auth/auth_feauter/domain/usecase/auth_usecase.dart';
import 'package:auth/auth_feauter/presentation/screen/auth/bloc/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // Register FirebaseAuth first
  locator.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);

  // Then register FirebaseAuthService, since it depends on FirebaseAuth
  locator
      .registerSingleton<FirebaseAuthService>(FirebaseAuthService(locator()));

  // Register AuthRepositoryImpl as AuthRepository
  locator.registerSingleton<AuthRepository>(
      AuthRepositoryImpl(firebaseAuthService: locator()));

  //  Register Usecase
  locator.registerSingleton<AuthUsecase>(AuthUsecase(locator()));

  // Register Bloc
  locator.registerSingleton<AuthBloc>(AuthBloc(locator()));
}
