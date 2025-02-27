import 'package:auth/auth_feauter/data/model/auth_model.dart';
import 'package:auth/auth_feauter/domain/entity/auth_enity.dart';

abstract class AuthRepository {
  Future<void> signUpWithEmailAndPassword(AuthEnity auth);
  Future<void> signInWithEmailAndPassword(AuthModel auth);
  Future<bool> isEmailRegistered(String email);
  Future<void> signOut();
}
