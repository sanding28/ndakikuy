// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndakikuy/cubit/page_cubit.dart';
import 'package:ndakikuy/pages/book_page.dart';
import 'package:ndakikuy/pages/home_page.dart';
import 'package:ndakikuy/pages/mount_page.dart';
import 'package:ndakikuy/pages/profil_page.dart';
import 'package:ndakikuy/shared/theme.dart';
import 'package:ndakikuy/widgets/custom_bottom_navbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget buildContent(int currentIndex){
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return MountPage();
        case 2:
          return BookPage();
        case 3:
          return ProfilPage();
        default:
          return HomePage();
      }
    }

    Widget customButtonNavigation(){
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
            color: keyWhiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ) 
          ),
          child: Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomNavbar(imgaeUrl: 'assets/home.png', index: 0,),
                CustomNavbar(imgaeUrl: 'assets/icon_gunung.png', index: 1,),
                CustomNavbar(imgaeUrl: 'assets/book.png', index: 2,),
                CustomNavbar(imgaeUrl: 'assets/profile.png', index: 3,),
              ],
            ),
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: keybackgroundColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customButtonNavigation()
            ],
          ),
          
        );
      },
    );
  }
}