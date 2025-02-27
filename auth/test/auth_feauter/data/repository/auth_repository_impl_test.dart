import 'package:auth/auth_feauter/data/repository/auth_repository_impl.dart';
import 'package:auth/auth_feauter/domain/entity/auth_enity.dart';
import 'package:auth/auth_feauter/domain/usecase/auth_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([AuthRepositoryImpl])
void main() {
  late MockAuthRepositoryImpl mockAuthRepository;
  late AuthUsecase authUsecase;

  setUp(() {
    mockAuthRepository = MockAuthRepositoryImpl();
    authUsecase = AuthUsecase(mockAuthRepository);
  });

  group('AuthRepositoryImpl & AuthUsecase Tests', () {
    test('should return exception if the email is already registered',
        () async {
      when(mockAuthRepository.isEmailRegistered(any))
          .thenAnswer((_) async => true);

      expect(
        () async => await authUsecase.signUpWithEmailAndPassword(
          AuthEnity(email: "test@example.com", password: "Test@1234"),
        ),
        throwsException,
      );
    });
  });
}
