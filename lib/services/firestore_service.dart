import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirestoreService extends GetxService {
  Future<void> registerUser({
    required String userID,
    required String username,
    required String department,
    required String password,
  }) async {
    final docRef = FirebaseFirestore.instance.collection('users').doc(userID);

    // Check if userID already exists
    final doc = await docRef.get();
    if (doc.exists) {
      throw Exception("User already exists");
    }
    print("TEST: $userID, $username, $department, $password");

    // Save the user's credentials
    await docRef.set({
      'username': username,
      'userID': userID,
      'department': username,
      'password': password,
    });
  }

  Future<bool> loginUser(String userID, String password) async {
    final docRef = FirebaseFirestore.instance.collection('users').doc(userID);
    final doc = await docRef.get();
    print("Data: $userID, $password");

    if (!doc.exists) {
      return false;
    }

    final savedPassword = doc['password'];

    // Check password
    if (savedPassword == password) {
      return true;
    } else {
      return false;
    }
  }
}
