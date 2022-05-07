// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndakikuy/cubit/auth_cubit.dart';
import 'package:ndakikuy/shared/theme.dart';
import 'package:ndakikuy/widgets/custom_button.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({ Key? key }) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Widget title(){
      return Container(
        height: 40,
        width: 113,
        margin: EdgeInsets.only(top: 48, left: defaultMargin, right: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Sign Up',
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 20
              ),
            )
          ],
        ),
      );
    }

    Widget inputSection(){

      Widget nameInput(){
        return Container(
          margin: EdgeInsets.only(top: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Full Name',
                style: blackTextStyle,
              ),
              SizedBox(height: 6,),
              TextFormField(
                controller: nameController,
                cursorColor: keyBlackColor,
                decoration: InputDecoration(
                  hintText: 'Input your Full Name',
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
            passwordInput(),
            nameInput()
          ],
        ),
      );
    }

    Widget button(){
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
              margin: EdgeInsets.only(
                top: 50,
                left: defaultMargin,
                right: defaultMargin
              ),
              tittle: 'Sign Up', 
              onPressed: (){
                context.read<AuthCubit>().signUp(
                  email: emailController.text, 
                  password: passwordController.text, 
                  name: nameController.text,
                );
              }
            );
        },
      );
    }

    Widget signIn(){
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/Login');
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 30, bottom: 73),
          child: Text(
            'already have an account? Login',
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
      body: ListView(
        children: [
          title(),
          inputSection(),
          button(),
          signIn()
        ],
      ),
    );
  }
}