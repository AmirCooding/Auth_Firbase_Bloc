import 'package:auth/auth_feauter/domain/entity/auth_enity.dart';
import 'package:auth/auth_feauter/domain/repository/auth_repository.dart';

class AuthUsecase {
  final AuthRepository _authRepository;

  AuthUsecase(this._authRepository);

  Future<void> signUpWithEmailAndPassword(AuthEnity auth) {
    return _authRepository.signUpWithEmailAndPassword(auth);
  }

  Future<bool> isEmailRegistered(String email) {
    return _authRepository.isEmailRegistered(email);
  }

  // Helper method to validate password strength
  bool isValidPassword(String password) {
    final regex =
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return regex.hasMatch(password);
  }
}
