// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:ndakikuy/shared/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget bannerLogo(){
      return Container(
        width: double.infinity,
        height: 369,
        decoration: BoxDecoration(
          color: keyPrimaryColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
        ),
        child: Container(
          margin: EdgeInsets.only(left: 24, top: 37),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 102,
                height: 72,
                
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo.png')
                  )
                ),
              ),
              SizedBox(height: 14,),
              Text(
                'Welcome',
                style: whiteTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: bold,
                ),
              ),
              SizedBox(height: 5,),
              Text(
                'Sign-in to continue',
                style: whiteTextStyle,
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: keyWhiteColor,
      body: SafeArea(
        child: ListView(
          children: [
            bannerLogo()
          ],
        )
      ),
    );
  }
}