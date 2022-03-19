// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ndakikuy/shared/theme.dart';

class BasecampTrend extends StatelessWidget {
  const BasecampTrend({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 160,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: keyWhiteColor
      ),
      child: Container(
        margin: EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              width: 140,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: AssetImage('assets/merbabu_selo.jfif'), fit: BoxFit.cover)
              ),
            ),
            SizedBox(height: 12,),
            Text(
              'Merbabu Via Selo',
              style: blackTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 12
              ),
            ),
            SizedBox(height: 12,),
            Text(
              'Boyolali',
              style: blackTextStyle.copyWith(
                fontWeight: light,
                fontSize: 12
              ),
            )
          ],
        ),
      ),
    );
  }
}