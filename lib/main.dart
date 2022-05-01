// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndakikuy/cubit/auth_cubit.dart';
import 'package:ndakikuy/cubit/page_cubit.dart';
import 'package:ndakikuy/pages/Login_page.dart';
import 'package:ndakikuy/pages/main_page.dart';
import 'package:ndakikuy/pages/mulai_page.dart';
import 'package:ndakikuy/pages/signUp_page.dart';
import 'package:ndakikuy/pages/splash_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PageCubit()),
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => SplashPage(),
          '/Mulai-page':(context) => MulaiPage(),
          '/Sign-Up':(context) => SignUpPage(),
          '/Login-Page':(context) => LoginPage(),
          '/main-page':(context) => MainPage()
        },
      ),
    );
  }
}