// ignore_for_file: prefer_final_fields, unused_field, use_rethrow_when_possible

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ndakikuy/models/user_model.dart';

class UserService {
  CollectionReference _userReference = FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'password': user.password,
        'name': user.name,
      });
    } catch (e) {
      throw e;
    }
  }
}