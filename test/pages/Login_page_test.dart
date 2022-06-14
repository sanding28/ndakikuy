// // ignore_for_file: unused_local_variable, prefer_const_constructors

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:ndakikuy/pages/Login_page.dart';

// void main() {
//   testWidgets('Login page', (WidgetTester tester) async {
//     //find widget needed
//     final addField = find.byKey(ValueKey('email'));
//     final addField2 = find.byKey(ValueKey('password'));
//     final pressButton = find.byKey(ValueKey('sign-in'));

//     await tester.pumpWidget(MaterialApp(home: LoginPage(),));
//     await tester.enterText(addField, "bambang@gmail.com");
//     await tester.enterText(addField2, "1234567");
//     await tester.tap(pressButton);
//     await tester.pump();

//     expect(find.text("hello"), findsOneWidget);

//   });
// }