import 'package:auth/auth_feauter/domain/entity/auth_enity.dart';
import 'package:auth/auth_feauter/domain/repository/auth_repository.dart';

class AuthUsecase {
  final AuthRepository _authRepository;

  AuthUsecase(this._authRepository);

  Future<void> signUpWithEmailAndPassword(AuthEnity auth) async {
    if (await _authRepository.isEmailRegistered(auth.email)) {
      throw Exception("The email is already registered.");
    }
    return _authRepository.signUpWithEmailAndPassword(auth);
  }

  Future<bool> isEmailRegistered(String email) async {
    if (email.isEmpty) {
      throw Exception("Email cannot be empty.");
    }
    try {
      return await _authRepository.isEmailRegistered(email);
    } catch (e) {
      throw Exception("Error checking email registration: ${e.toString()}");
    }
  }

  // Helper method to validate password strength
  bool isValidPassword(String password) {
    final regex =
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return regex.hasMatch(password);
  }
}
