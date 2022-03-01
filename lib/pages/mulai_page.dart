// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ndakikuy/shared/theme.dart';

class MulaiPage extends StatelessWidget {
  const MulaiPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/gunung.png')
              )
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Booking Basecamp\nPendakian Dengan\nMudah',
                  style: whiteTextStyle.copyWith(
                    fontSize: 32,
                    fontWeight: medium,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10,),
                Text(
                  'Explore kemudian memilih jalur pendakian\ntujuan anda dengan mudah dan cepat.',
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: EdgeInsets.only(top: 50, bottom: 70),
                  width: 193,
                  height: 51,
                  child: TextButton(
                    onPressed: () {}, 
                    style: TextButton.styleFrom(
                      backgroundColor: btnColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15) 
                      ),
                    ),
                    child: 
                    Text(
                      'Get Started',
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium
                      ),
                    )
                  ),
                )
              ],
            ),
          )
        ],),
    );
  }
}