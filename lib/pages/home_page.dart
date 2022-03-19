// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:ndakikuy/shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget topBanner(){
      return Container(
        height: 230,
        width: double.infinity,
        decoration: BoxDecoration(
          color: keyPrimaryColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: defaultMargin, top: 50 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello,\nNama User',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 20
                    ),
                  ),
                  SizedBox(height: 2,),
                  Text(
                    'Mau mendaki ke mana hari ini?',
                    style: whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: light
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 60,
              width: 60,
              margin: EdgeInsets.only(top: 50),
              decoration : BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/profile.png'))
              )
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          topBanner()
        ],
      ),
    );
  }
}