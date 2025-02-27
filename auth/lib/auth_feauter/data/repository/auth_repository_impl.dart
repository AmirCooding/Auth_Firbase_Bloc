import 'package:auth/auth_feauter/data/model/auth_model.dart';
import 'package:auth/auth_feauter/data/remote/firbase_sarvice/firebase_auth_service.dart';
import 'package:auth/auth_feauter/domain/entity/auth_enity.dart';
import 'package:auth/auth_feauter/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({required this.firebaseAuthService});
  FirebaseAuthService firebaseAuthService;

  @override
  Future<bool> isEmailRegistered(String email) {
    return firebaseAuthService.isEmailAlreadyRegistered(email);
  }

  @override
  Future<void> signInWithEmailAndPassword(AuthModel auth) {
    return firebaseAuthService.signIn(auth);
  }

  @override
  Future<void> signOut() {
    return firebaseAuthService.signOut();
  }

  @override
  Future<void> signUpWithEmailAndPassword(AuthEnity auth) {
    final authModel = AuthModel(
      email: auth.email,
      password: auth.password,
    );
    return firebaseAuthService.signUp(authModel);
  }
}
