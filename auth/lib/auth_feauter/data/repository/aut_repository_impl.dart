import 'package:auth/auth_feauter/data/model/auth_model.dart';
import 'package:auth/auth_feauter/data/remote/firbase_sarvice/firebase_auth_service.dart';
import 'package:auth/auth_feauter/domain/entity/auth_enity.dart';
import 'package:auth/auth_feauter/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AutRepositoryImpl extends AuthRepository {
  AutRepositoryImpl({required this.firebaseAuthService});
  FirebaseAuthService firebaseAuthService;

  @override
  Future<void> isEmailRegistered(String email) {
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
  Future<void> signUpWithEmailAndPassword(AuthModel auth) {
    return firebaseAuthService.signUp(auth);
  }
}
