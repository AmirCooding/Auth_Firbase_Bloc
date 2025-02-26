import 'dart:io';
import 'dart:developer';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage _firebaseStorage;

  FirebaseStorageService(this._firebaseStorage);

  /// Upload an image to Firebase Storage and return the download URL
  Future<String?> uploadImage(File file, String userId) async {
    try {
      final String filePath = "users/$userId/profile.jpg";
      final ref = _firebaseStorage.ref().child(filePath);
      final UploadTask uploadTask = ref.putFile(file);

      // Wait for the upload and get the snapshot result
      final TaskSnapshot snapshot = await uploadTask.whenComplete(() => {});

      // Get the URL after the successful upload
      final String downloadUrl = await snapshot.ref.getDownloadURL();

      log("\u2705 Image uploaded: $downloadUrl");
      return downloadUrl;
    } catch (e) {
      log("\u274C Error uploading image: $e");
      return null;
    }
  }

  /// Retrieve the download URL of an uploaded image
  Future<String?> getImageUrl(String userId) async {
    try {
      final ref = _firebaseStorage.ref().child("users/$userId/profile.jpg");
      final String downloadUrl = await ref.getDownloadURL();

      log("\u2705 Image URL: $downloadUrl");
      return downloadUrl;
    } catch (e) {
      log("\u274C Error getting image URL: $e");
      return null;
    }
  }
}
