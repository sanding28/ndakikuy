// // ignore_for_file: unused_local_variable

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:ndakikuy/services/auth_service.dart';

// class MockUser extends Mock implements User {}

// final MockUser _mockUser = MockUser();

// class MockAuthFirebase extends Mock implements FirebaseAuth {
//   @override
//   Stream<User?> authStateChanges() {
//     return Stream.fromIterable([
//       _mockUser,
//     ]);
//   }
// }

// void main() {
//   final MockAuthFirebase mockAuthFirebase = MockAuthFirebase();
//   final AuthService _auth = AuthService(_auth: mockAuthFirebase);
//   setUp(() {

//   });
//   tearDown(() {});

//   test("emit ", () async{});
// }