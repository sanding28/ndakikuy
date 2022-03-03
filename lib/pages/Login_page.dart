// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:ndakikuy/shared/theme.dart';
import 'package:ndakikuy/widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget bannerLogo(){
      return Container(
        width: double.infinity,
        height: 300,
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

    Widget inpuSection(){

      Widget emailInput(){
        return Container(
          margin: EdgeInsets.only(top: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email address',
                style: blackTextStyle,
              ),
              SizedBox(height: 6,),
              TextFormField(
                cursorColor: keyBlackColor,
                decoration: InputDecoration(
                  hintText: 'Input your email...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), 
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: keyPrimaryColor),
                    borderRadius: BorderRadius.circular(15),
                  )
                ),
              )
            ],
          ),
        );
      }

      Widget passwordInput(){
        return Container(
          margin: EdgeInsets.only(top: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Password',
                style: blackTextStyle,
              ),
              SizedBox(height: 6,),
              TextFormField(
                cursorColor: keyBlackColor,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Input your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), 
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: keyPrimaryColor),
                    borderRadius: BorderRadius.circular(15),
                  )
                ),
              )
            ],
          ),
        );
      }

      return Container(
        padding: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
        decoration: BoxDecoration(
          color: keyWhiteColor
        ),
        child: Column(
          children: [
            emailInput(),
            passwordInput()
          ],
        ),
      );
    }

    Widget buttonSignIn(){
      return Container(
        width: 200,
        height: 140,
        child: Column(
          children: [
            CustomButton(
              margin: EdgeInsets.only(top: 40, bottom: 20),
              width: 193,
              tittle: 'Login', 
              onPressed: (){
                Navigator.pushNamed(context, '/main-page');
              }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account?',
                  style: blackTextStyle.copyWith(
                    fontSize: 12
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/Sign-Up');
                  },
                  child: Text(
                    'SignUp',
                    style: orangeTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: keyWhiteColor,
      body: SafeArea(
        child: ListView(
          children: [
            bannerLogo(),
            inpuSection(),
            buttonSignIn()
          ],
        )
      ),
    );
  }
}