import 'package:auth/auth_feauter/data/remote/firbase_sarvice/firebase_auth_service.dart';
import 'package:auth/auth_feauter/data/repository/auth_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(() => FirebaseAuth.instance);
  locator.registerLazySingleton(
      () => FirebaseAuthService(locator<FirebaseAuth>()));
  locator.registerLazySingleton(() =>
      AuthRepositoryImpl(firebaseAuthService: locator<FirebaseAuthService>()));
  // locator.registerLazySingleton(() => AuthBloc(locator<AuthRepository>()));
}
