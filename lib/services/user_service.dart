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

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return UserModel(
        id: id, 
        email: snapshot['email'], 
        password: snapshot['password'],
        name: snapshot['name'],
      );
    } catch (e) {
      throw e;
    }
  }
}