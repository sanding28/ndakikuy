// ignore_for_file: unused_field, sized_box_for_whitespace, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ndakikuy/shared/theme.dart';
import 'package:ndakikuy/widgets/custom_button.dart';

class FormPendaki extends StatefulWidget {
  const FormPendaki({ Key? key }) : super(key: key);

  @override
  State<FormPendaki> createState() => _FormPendakiState();
}

class _FormPendakiState extends State<FormPendaki> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController ktpController = TextEditingController();

  String _name ='';
  String _alamat ='';
  String _ktp = '';
  String _noHp = '';

  @override
  Widget build(BuildContext context) {

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference forms = firestore.collection('forms');

    Widget formPendaki(){
      return Container(
        height: 390,
        width: double.infinity,
        decoration: BoxDecoration(
          color: keybackgroundColor
        ),
        child: Container(
          margin: const EdgeInsets.only(right: 24, left:24, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'form pendaki dan pembayaran',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold
                ),
              ),
              const SizedBox(height: 30,),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Full Name'
                ),
                onChanged: (value){
                  _name = value;
                },
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: alamatController,
                decoration: const InputDecoration(
                  hintText: 'Alamat'
                ),
                onChanged: (value){
                  _alamat = value;
                },
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: ktpController,
                decoration: const InputDecoration(
                  hintText: 'No Ktp'
                ),
                onChanged: (value){
                  _ktp = value;
                },
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: noHpController,
                decoration: const InputDecoration(
                  hintText: 'No.Hp'
                ),
                onChanged: (value){
                  _noHp = value;
                },
              ),
              // CheckboxListTile(value: , onChanged: onChanged)
            ],
          ),
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
              height: 70,
              margin: const EdgeInsets.only(right: 24, left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Metode pembayaran',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 159,
                        height: 40,
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 76,
                              decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/gopay.png'))
                              ),
                            ),
                            Text(
                              'Gopay',
                              style: blackTextStyle.copyWith(
                                fontSize: 12
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 46,
                        height: 17,
                        child: Text(
                          'Change', 
                          style: orangeTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: bold
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ),
            Container(
              height: 250,
              width: double.infinity,
              margin: EdgeInsets.only(right: 24, left: 24, top: 20,),
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
                          style: blackTextStyle,
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

    Widget buttonBayar(){
      return Container(
        margin: EdgeInsets.only(bottom: 40),
        child: CustomButton(
          tittle: 'Bayar', 
          onPressed: (){
            forms.add({
              'name' : nameController.text,
              'alamat' : alamatController.text,
              'ktp' : int.tryParse(ktpController.text) ?? 0,
              'noHp' : int.tryParse(noHpController.text) ?? 0,
            });
            Navigator.pushNamed(context, '/main-page');
          }
        ),
      );
    }

    return Scaffold(
      body: SafeArea(child: ListView(
        children: [
          formPendaki(),
          methodAndSummary(),
          buttonBayar()
        ],
      )),
    );
    
  }
}