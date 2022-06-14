// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_constructors_in_immutables
//Belum atau sepertinya tidak terpakai
import 'package:flutter/material.dart';
import 'package:ndakikuy/models/transactions_model.dart';
import 'package:ndakikuy/shared/theme.dart';

class CheckOut extends StatelessWidget {
  final TransactionsModel transactions;
  CheckOut(this.transactions,{ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget basecampPilihan(){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        height: 120,
        width: MediaQuery.of(context).size.width,
        // color: keybackgroundColor,
        child: Row(
          children: [
            Container(
              height: 110,
              width: 120,
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: AssetImage('assets/sumbing_bowongso.jfif'))
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Gunung Sumbing',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  'Magelang',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: light
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget identitasPendaki(){
      return Container(
        margin: EdgeInsets.only(top: 20, left: defaultMargin, right: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Identitas Pendaki',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: double.infinity,
              padding:EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: keyBlackColor,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama : Ahmad Bustomi',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'Alamat : jl.Sumbing no 55 Malang',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'No.Ktp : 334229402943450',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'No.Hp : 084668374949',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget methodAndSummary(){
      return Container(
        height: 400,
        width: double.infinity,
        color: keybackgroundColor,
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              margin: EdgeInsets.only(right: 24, left: 24, top: 40,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: 121,
                    child: Row(
                      children: [
                        Text(
                          'Order Summary',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          )
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 176,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: btnColor
                      ),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 16, left: 16, top: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Biaya pendakian',
                                style: blackTextStyle.copyWith(
                                  fontSize: 12
                                ),
                              ),
                              Text(
                                'Rp 40.000',
                                style: blackTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: bold
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 16, left: 16, top: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Biaya penanganan',
                                style: blackTextStyle.copyWith(
                                  fontSize: 12
                                ),
                              ),
                              Text(
                                'Rp 1000',
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 16, left: 16, top: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Asuransi',
                                style: blackTextStyle.copyWith(
                                  fontSize: 12
                                ),
                              ),
                              Text(
                                'Rp 10.000',
                                style: blackTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: bold
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 35),
                          height: 47,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: keyOrangeColor
                          ),
                          child: Container(
                          margin: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: blackTextStyle.copyWith(
                                  fontSize: 12
                                ),
                              ),
                              Text(
                                'Rp 51.000',
                              )
                            ],
                          ),
                        ),
                        )
                      ],
                    ),
                  ),
                ]
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: keybackgroundColor,
      body: ListView(
        children: [
          basecampPilihan(),
          identitasPendaki(),
          methodAndSummary(),
        ],
      ),
    );
  }
}