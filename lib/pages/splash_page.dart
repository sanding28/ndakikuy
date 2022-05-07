// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ndakikuy/cubit/auth_cubit.dart';
import 'package:ndakikuy/pages/mulai_page.dart';
import 'package:ndakikuy/shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Timer(Duration(seconds: 4), (){

      User? user = FirebaseAuth.instance.currentUser;

      if(user == null){
        Navigator.pushNamedAndRemoveUntil(context, '/Mulai-page', (route) => false);
      } else {
        context.read<AuthCubit>().getCurrentUser(user.uid);
        print(user.email);
        Navigator.pushNamedAndRemoveUntil(context, '/main-page', (route) => false);
      }
      // Navigator.push(context, MaterialPageRoute(builder: (context) => MulaiPage() ));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: keyPrimaryColor,
      body: Center(
        child: Container(
          width: 200,
          height: 125,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/logo.png'))
          ),
        ),
      ),
    );
  }
}