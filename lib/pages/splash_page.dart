// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'dart:async';

import 'package:flutter/material.dart';
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
      Navigator.push(context, MaterialPageRoute(builder: (context) => MulaiPage() ));
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