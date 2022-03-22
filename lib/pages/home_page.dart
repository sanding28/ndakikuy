// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ndakikuy/shared/theme.dart';
import 'package:ndakikuy/widgets/basecamp_new.dart';
import 'package:ndakikuy/widgets/trend_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget topBanner(){
      return Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: keyPrimaryColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: defaultMargin, top: 30 ),
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
              height: 50,
              width: 50,
              margin: EdgeInsets.only(top: 30, right: 24),
              decoration : BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/profilpic.png'))
              )
            )
          ],
        ),
      );
    }
    
    Widget basecampTrend(){
      return Container(
        height: 291,
        margin: EdgeInsets.only(left: 24, top: 240),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 16,
              width: 180,
              child: Row(
                children: [
                  Text(
                    'Sedang trend saat ini',
                    style: blackTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 14
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 255,
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BasecampTrend(),
                    BasecampTrend(),
                    BasecampTrend(),
                    BasecampTrend(),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget basecampNew(){
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 24, top: 550, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 16,
              child: Row(
                children: [
                  Text(
                    'Baru berganung',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold
                    ),
                  )
                ],
              )
            ),
            BasecampNew(),
            BasecampNew(),
            BasecampNew(),
            BasecampNew(),
            BasecampNew(),
          ],
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            topBanner(),
            basecampTrend(),
            basecampNew()
          ],
        ),
      ),
    );
  }
}