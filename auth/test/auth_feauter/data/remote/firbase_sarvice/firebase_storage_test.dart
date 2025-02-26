import 'dart:io';
import 'package:auth/auth_feauter/data/remote/firbase_sarvice/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'firebase_storage_test.mocks.dart';

@GenerateMocks([FirebaseStorage, Reference, UploadTask, TaskSnapshot])
void main() {
  late FirebaseStorageService storageService;
  late MockFirebaseStorage mockFirebaseStorage;
  late MockReference mockReference;
  late MockUploadTask mockUploadTask;
  late MockTaskSnapshot mockTaskSnapshot;

  setUp(() {
    mockFirebaseStorage = MockFirebaseStorage();
    mockReference = MockReference();
    mockUploadTask = MockUploadTask();
    mockTaskSnapshot = MockTaskSnapshot();
    storageService = FirebaseStorageService(mockFirebaseStorage);

    when(mockFirebaseStorage.ref()).thenReturn(mockReference);
    when(mockReference.child(any)).thenReturn(mockReference);
  });

  const String testUserId = "testUser123";
  final File mockFile = File("test.jpg");
  const String testDownloadUrl = "https://mock-url.com/image.jpg";

  group('Firebase Storage Tests', () {
    test('uploadImage should return download URL when successful', () async {
      when(mockFirebaseStorage.ref()).thenReturn(mockReference);
      when(mockReference.child(any)).thenReturn(mockReference);
      when(mockReference.putFile(any)).thenAnswer((_) => mockUploadTask);

      when(mockUploadTask.whenComplete(any))
          .thenAnswer((_) async => mockTaskSnapshot);
      when(mockTaskSnapshot.ref).thenReturn(mockReference);
      when(mockReference.getDownloadURL())
          .thenAnswer((_) async => testDownloadUrl);

      final result = await storageService.uploadImage(mockFile, testUserId);

      expect(result, testDownloadUrl);
      verify(mockFirebaseStorage.ref()).called(1);
      verify(mockReference.child("users/$testUserId/profile.jpg")).called(1);
      verify(mockReference.putFile(mockFile)).called(1);
    });

    test('uploadImage should return null and log error when upload fails',
        () async {
      when(mockFirebaseStorage.ref()).thenReturn(mockReference);
      when(mockReference.child(any)).thenReturn(mockReference);
      when(mockReference.putFile(any)).thenThrow(Exception("Upload failed"));

      final result = await storageService.uploadImage(mockFile, testUserId);

      expect(result, isNull);
      verify(mockFirebaseStorage.ref()).called(1);
      verify(mockReference.child("users/$testUserId/profile.jpg")).called(1);
      verify(mockReference.putFile(mockFile)).called(1);
    });
  });
}
