import 'package:auth/auth_feauter/data/model/auth_model.dart';

abstract class AuthRepository {
  Future<void> signUpWithEmailAndPassword(AuthModel auth);
  Future<void> signInWithEmailAndPassword(AuthModel auth);
  Future<void> isEmailRegistered(String email);
  Future<void> signOut();
}
