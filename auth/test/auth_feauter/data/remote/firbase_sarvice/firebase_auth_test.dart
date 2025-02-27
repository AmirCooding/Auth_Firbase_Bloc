import 'package:auth/auth_feauter/data/model/auth_model.dart';
import 'package:auth/auth_feauter/data/remote/firbase_sarvice/firebase_auth_service.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'firebase_auth_test.mocks.dart';

@GenerateMocks([
  FirebaseAuth,
  User,
  UserCredential,
])
void main() {
  late FirebaseAuthService authRepo;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUser mockUser;
  late MockUserCredential mockUserCredential;

  setUp(() {
    //   Create instances of the mocks
    mockFirebaseAuth = MockFirebaseAuth();
    mockUser = MockUser();
    mockUserCredential = MockUserCredential();

    //  Inject mock FirebaseAuth into the auth repository
    authRepo = FirebaseAuthService(mockFirebaseAuth);
  });

  group('Firebase Authentication Tests', () {
    const testEmail = "test@example.com";
    const testPassword = "password123";
    const testUserId = "123456";

    test('signUp should return AuthModel when successful', () async {
      //  Mock Firebase behavior for user registration
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
        email: testEmail,
        password: testPassword,
      )).thenAnswer((_) async => mockUserCredential);

      when(mockUserCredential.user).thenReturn(mockUser);
      when(mockUser.uid).thenReturn(testUserId);
      when(mockUser.email).thenReturn(testEmail);

      //  Call signUp method
      final result = await authRepo
          .signUp(AuthModel(email: testEmail, password: testPassword));

      //  Validate results
      expect(result, isNotNull);
      expect(result?.id, testUserId);
      expect(result?.email, testEmail);
    });

    test('signIn should return AuthModel when successful', () async {
      //  Mock Firebase behavior for user login
      when(mockFirebaseAuth.signInWithEmailAndPassword(
        email: testEmail,
        password: testPassword,
      )).thenAnswer((_) async => mockUserCredential);

      when(mockUserCredential.user).thenReturn(mockUser);
      when(mockUser.uid).thenReturn(testUserId);
      when(mockUser.email).thenReturn(testEmail);

      //  Call signIn method
      final result = await authRepo
          .signIn(AuthModel(email: testEmail, password: testPassword));

      //  Validate results
      expect(result, isNotNull);
      expect(result?.id, testUserId);
      expect(result?.email, testEmail);
    });

    test('signOut should call Firebase signOut', () async {
      //  Mock Firebase signOut behavior
      when(mockFirebaseAuth.signOut()).thenAnswer((_) async {});

      //  Call signOut method
      await authRepo.signOut();

      //  Verify signOut was called
      verify(mockFirebaseAuth.signOut()).called(1);
    });
  });
}
