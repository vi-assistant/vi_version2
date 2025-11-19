import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:vi_assistant/models/user.dart';
import 'package:vi_assistant/services/box_service.dart';

class FirestoreService extends GetxService {
  BoxService box = Get.find<BoxService>();
  Future<User> registerUser({
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

    // Save the user's credentials
    final data = {
      'username': username,
      'userID': userID,
      'department': department,
      'password': password,
    };
    await docRef.set(data);
    return User.fromJson(data);
  }

  Future<User> loginUser(String userID, String password) async {
    final docRef = FirebaseFirestore.instance.collection('users').doc(userID);
    final doc = await docRef.get();

    if (!doc.exists) {
      throw Exception("User doesn't exist");
    }

    final savedPassword = doc['password'];
    if (savedPassword == password) {
      final data = doc.data();
      if (data == null) {
        throw Exception("User data is null");
      }
      return User.fromJson(data);
    } else {
      throw Exception("Wrong credentials");
    }
  }

  Future<bool> checkDepartment(String department) async {
    final docRef = FirebaseFirestore.instance
        .collection('data')
        .doc('departments');
    final doc = await docRef.get();
    final depts = doc.data()!.values.toList();
    if (depts.contains(department)) {
      return true;
    } else {
      return false;
    }
  }

  Future<Map?> getBooks() async {
    print(box.getUser().department);
    final docRef = FirebaseFirestore.instance
        .collection('departments')
        .doc(box.getUser().department);
    final doc = await docRef.get();
    return doc.data();
  }
}
