// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ndakikuy/pages/Login_page.dart';
import 'package:ndakikuy/pages/mulai_page.dart';
import 'package:ndakikuy/pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => SplashPage(),
        '/Mulai-page':(context) => MulaiPage(),
        '/Login-Page':(context) => LoginPage()
      },
    );
  }
}