// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ndakikuy/cubit/auth_cubit.dart';
import 'package:ndakikuy/shared/theme.dart';
import 'package:ndakikuy/widgets/custom_button.dart';
import 'package:ndakikuy/widgets/profile_card.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget topBanner(){
      return Container(
        height: 260,
        padding: EdgeInsets.only(top: 35, left: 24, right: 24),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
              ],
            ),
            Container(
              height: 165,
              margin: EdgeInsets.only(top:10),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 99,
                        margin: EdgeInsets.only(right: 24,),
                        decoration : BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage('assets/profilpic.png'))
                        )
                      )
                    ],
                  ),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if(state is AuthSuccess){
                        return Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // ignore: unnecessary_string_interpolations
                              '${state.user.name}',
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: semiBold
                              ),
                            ),
                            SizedBox(height: 15,),
                            Text(
                              // ignore: unnecessary_string_interpolations
                              '${state.user.email}',
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: reguler
                              ),
                            ),
                          ],
                        ),
                      );
                      } else {
                        return Container();
                      }
                      
                    },
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget profileContent(){
      return Container(
        margin: EdgeInsets.only(top: 256, left: 24, right: 24),
        child: Column(
          children: [
            ProfileCard(imageUrl: 'assets/history.png', name: 'My History'),
            ProfileCard(imageUrl: 'assets/book.png', name: 'My orders'),
            ProfileCard(imageUrl: 'assets/settings.png', name: 'Settings'),
            ProfileCard(imageUrl: 'assets/Help.png', name: 'Help'),
          ],
        ),
      );
    }

    Widget buttonLogout(){
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if(state is AuthFailed){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: keyPrimaryColor,
                content: Text(state.error),
              )
            );
          } else if(state is AuthInitial){
            Navigator.pushNamedAndRemoveUntil(context, '/Sign-Up', (route) => false);
          }
        },
        builder: (context, state) {
          if(state is AuthLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
              margin: EdgeInsets.only(top: 550,),
              child: Container(
                margin: EdgeInsets.only(top: 40, bottom: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      tittle: 'Logout', 
                      onPressed: (){
                        context.read<AuthCubit>().signOut();
                      }),
                  ],
                ),
              )
            );
        },
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            topBanner(),
            profileContent(),
            buttonLogout()
          ],
        ),
      ),
    );
  }
}