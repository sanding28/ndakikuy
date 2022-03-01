// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:ndakikuy/shared/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({ Key? key }) : super(key: key);

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