// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ndakikuy/shared/theme.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget topImage(){
      return Container(
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/raung_kalibaru.jfif'), fit: BoxFit.cover)
        ),
      );
    }

    Widget detailsContent(){
      return Container(
        margin: EdgeInsets.only(top: 350),
        decoration: BoxDecoration(
          color: keybackgroundColor,
          // borderRadius: BorderRadius.only(
          //   topRight: Radius.circular(30),
          //   topLeft: Radius.circular(30)
          // ),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 40, left: defaultMargin, right: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gunung Merbabu Via Selo',
                style: blackTextStyle.copyWith(
                  fontWeight: bold
                ),
              ),
              SizedBox(height: 16,),
              Text(
                'Tentang',
                style: blackTextStyle.copyWith(
                  fontWeight: bold
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'Merbabu via selo merupakan pos pendakian\ngunung merbabu yang terletak  Dusun Pakis, Desa Tarurabatang, Kecamatan Selo, Kabupaten Boyolali. Pos pendakian ini dikenal karena keindahan sabana yang sangat luas.'
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            topImage(),
            detailsContent()
          ],
        ),
      ),
    );
  }
}