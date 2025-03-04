import 'package:auth/auth_feauter/domain/entity/auth_enity.dart';

abstract class AuthRepository {
  Future<void> signUpWithEmailAndPassword(AuthEntity auth);
  Future<void> signInWithEmailAndPassword(AuthEntity auth);
  Future<bool> isEmailAlreadyRegistered(String email);
  Future<void> signOut();
}
