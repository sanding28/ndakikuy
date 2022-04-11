// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:ndakikuy/pages/form_pendaki.dart';
import 'package:ndakikuy/shared/theme.dart';
import 'package:ndakikuy/widgets/custom_button.dart';
import 'package:ndakikuy/widgets/unordered_list.dart';

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
                  fontWeight: bold,
                  fontSize: 18
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
                'Merbabu via selo merupakan pos pendakian\ngunung merbabu yang terletak  Dusun Pakis, Desa Tarurabatang, Kecamatan Selo, Kabupaten Boyolali. Pos pendakian ini dikenal karena keindahan sabana yang sangat luas.',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: light
                ),
              ),
              SizedBox(height: 25,),
              Container(
                height: 153,
                width: 260,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fasilitas dan keunggulan Basecamp ',
                      style: blackTextStyle.copyWith(
                        fontWeight: bold
                      ),
                    ),
                    SizedBox(height:16),
                    UnordredList(tittle: 'Mushola'),
                    UnordredList(tittle: 'Tempat istirahat luas'),
                    UnordredList(tittle: 'Kamar Mandi'),
                    UnordredList(tittle: 'Wifi'),
                    UnordredList(tittle: 'Jalur pendakian baru diperbaiki'),
                    UnordredList(tittle: 'Basecamp berada dekat jalan raya'),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 153,
                width: 260,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Larangan Basecamp ',
                      style: blackTextStyle.copyWith(
                        fontWeight: bold
                      ),
                    ),
                    SizedBox(height:16),
                    UnordredList(tittle: 'Masuk tanpa ijin'),
                    UnordredList(tittle: 'Membuang sampah sembarangan'),
                    UnordredList(tittle: 'Membuat api unggun'),
                    UnordredList(tittle: 'Tidak membawa sampah turun'),
                    UnordredList(tittle: 'Menebang pohon'),
                    UnordredList(tittle: 'Membawa senjata tajam\n(dengan panjang lebih dari 30cm)'),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget buttonLanjut(){
      return Container(
        color: keybackgroundColor,
        margin: EdgeInsets.only(top: 880,),
        child: Container(
          margin: EdgeInsets.only(top: 40, bottom: 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                tittle: 'Lanjutkan', 
                onPressed: (){
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => FormPendaki()));
                }),
            ],
          ),
        )
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            topImage(),
            detailsContent(),
            buttonLanjut()
          ],
        ),
      ),
    );
  }
}