// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
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
                        width: 100,
                        margin: EdgeInsets.only(right: 24,),
                        decoration : BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage('assets/profilpic.png'))
                        )
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fitri Rizkillah',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text(
                          'fitri@gmail.com',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: reguler
                          ),
                        ),
                      ],
                    ),
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
      return Container(
        margin: EdgeInsets.only(top: 550,),
        child: Container(
          margin: EdgeInsets.only(top: 40, bottom: 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                tittle: 'Logout', 
                onPressed: (){}),
            ],
          ),
        )
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