import 'package:auth/auth_feauter/data/model/auth_model.dart';
import 'package:auth/auth_feauter/domain/entity/auth_enity.dart';
import 'package:auth/auth_feauter/domain/repository/auth_repository.dart';

class AuthUsecase {
  final AuthRepository _authRepository;

  AuthUsecase(this._authRepository);
// Helper method to sign in with email and password
  Future<void> signInWithEmailAndPassword(AuthEntity auth) async {
    return _authRepository.signInWithEmailAndPassword(auth);
  }

  // Helper method to sign up with email and password
  Future<void> signUpWithEmailAndPassword(AuthEntity auth) async {
    return _authRepository.signUpWithEmailAndPassword(auth);
  }

// Helper method to check if email is already registered
  Future<bool> isEmailAlreadyRegistered(String email) async {
    return await _authRepository.isEmailAlreadyRegistered(email);
  }

  // Helper method to validate password strength
  bool isValidPassword(String password) {
    final regex =
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return regex.hasMatch(password);
  }

  // Helper method to sign out
  Future<void> signOut() async {
    try {
      return await _authRepository.signOut();
    } catch (e) {
      throw Exception("Error signing out: ${e.toString()}");
    }
  }
}
