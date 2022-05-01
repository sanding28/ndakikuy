// ignore_for_file: prefer_final_fields, unused_field, unused_local_variable, use_rethrow_when_possible

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ndakikuy/models/user_model.dart';
import 'package:ndakikuy/services/user_service.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  }) async{
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel user = UserModel(
        id: userCredential.user!.uid,
        email: email,
        password: password,
        name: name,
      );

      await UserService().setUser(user);

      return user;
    } catch (e) {
      throw e;
    }
  }
}