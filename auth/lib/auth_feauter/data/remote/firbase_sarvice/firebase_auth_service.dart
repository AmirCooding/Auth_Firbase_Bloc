import 'dart:developer';

import 'package:auth/auth_feauter/data/model/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth;
  FirebaseAuthService(this._auth);

// check if email is already registered
  Future<bool> isEmailAlreadyRegistered(String email) async {
    try {
      final User? user = _auth.currentUser;
      return true;
    } catch (e) {
      log("Error checking email existence: $e");
      return false;
    }
  }

  Future<AuthModel?> signIn(AuthModel auth) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: auth.email,
        password: auth.password!,
      );
      final User? user = userCredential.user;
      if (user != null) {
        return AuthModel(
          email: user.email!,
          password: auth.password,
        );
      }
    } on FirebaseAuthException catch (e) {
      log('Failed with error code: ${e.code}');
      log(e.message!);
    }
  }

  Future<AuthModel?> signUp(AuthModel auth) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: auth.email,
        password: auth.password!,
      );

      final User? user = userCredential.user;
      if (user != null) {
        return AuthModel(
          email: user.email!,
          password: auth.password,
        );
      }
    } on FirebaseAuthException catch (e) {
      log(' Error by Sign Up: ${e.code}');
      log(e.message ?? "Unknow Error");
    }
    return null;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
