// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndakikuy/cubit/auth_cubit.dart';
import 'package:ndakikuy/shared/theme.dart';
import 'package:ndakikuy/widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({ Key? key }) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                key: Key('email'),
                controller: emailController,
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
                key: Key('password'),
                controller: passwordController,
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
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(context, '/main-page', (route) => false);
          }
          else if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: keyOrangeColor,
                ),
              );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return CustomButton(
            key: Key('sign-in'),
              margin: EdgeInsets.only(
                top: 50,
                left: defaultMargin,
                right: defaultMargin
              ),
              tittle: 'Login', 
              onPressed: (){
                context.read<AuthCubit>().signIn(
                  email: emailController.text, 
                  password: passwordController.text,
                );
              }
            );
        },
      );
    }

    Widget signUpButton(){
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/Sign-Up');
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 10, bottom: 73),
          child: Text(
            'Dont have an account? Sign Up',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
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
            buttonSignIn(),
            signUpButton()
          ],
        )
      ),
    );
  }
}