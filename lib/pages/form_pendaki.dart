// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ndakikuy/models/basecamp_model.dart';

import '../shared/theme.dart';
import '../widgets/custom_button.dart';

class FormPendaki extends StatefulWidget {
  final BasecampModel basecamp;
  FormPendaki(this.basecamp,{ Key? key }) : super(key: key);

  @override
  State<FormPendaki> createState() => _FormPendakiState();
}

class _FormPendakiState extends State<FormPendaki> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController alamatController = TextEditingController();

  final TextEditingController noHpController = TextEditingController();

  final TextEditingController ktpController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference forms = firestore.collection('forms');
    
    Widget formPendaki(){

      Widget nameInput(){
        return Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama Lengkap',
                style: blackTextStyle,
              ),
              SizedBox(height: 8,),
              TextFormField(
                controller: nameController,
                cursorColor: keyBlackColor,
                decoration: InputDecoration(
                  hintText: 'masukan nama lengkap anda',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), 
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: keyPrimaryColor),
                    borderRadius: BorderRadius.circular(15),
                  )
                ),
              )
            ],
          )
        );
      }

      Widget alamatInput(){
        return Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alamat Lengkap',
                style: blackTextStyle,
              ),
              SizedBox(height: 8,),
              TextFormField(
                controller: alamatController,
                cursorColor: keyBlackColor,
                decoration: InputDecoration(
                  hintText: 'masukan alamat anda',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), 
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: keyPrimaryColor),
                    borderRadius: BorderRadius.circular(15),
                  )
                ),
              )
            ],
          )
        );
      }

      Widget ktpInput(){
        return Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'No Ktp',
                style: blackTextStyle,
              ),
              SizedBox(height: 8,),
              TextFormField(
               controller: ktpController,
                cursorColor: keyBlackColor,
                decoration: InputDecoration(
                  hintText: 'masukan np ktp anda',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), 
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: keyPrimaryColor),
                    borderRadius: BorderRadius.circular(15),
                  )
                ),
              )
            ],
          )
        );
      }

      Widget noHpInput(){
        return Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'No Handphone',
                style: blackTextStyle,
              ),
              SizedBox(height: 8,),
              TextFormField(
                controller: noHpController,
                cursorColor: keyBlackColor,
                decoration: InputDecoration(
                  hintText: 'masukan no hp anda',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), 
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: keyPrimaryColor),
                    borderRadius: BorderRadius.circular(15),
                  )
                ),
              )
            ],
          )
        );
      }

      return Container(
        padding: EdgeInsets.only(left: defaultMargin, right: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            nameInput(),
            alamatInput(),
            ktpInput(),
            noHpInput(),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                showDatePicker(
                  context: context, 
                  initialDate: DateTime.now(), 
                  firstDate: DateTime.now(), 
                  lastDate: DateTime(2023),
                ).then((value) => 
                  setState(() {
                    selectedDate = value!;
                  })
                );
              }, 
              child: Text('Pilih Tanggal')
            )
          ],
        ),
      );
    }

    Widget methodAndSummary(){
      return Container(
        margin: EdgeInsets.only(top: 20),
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
                    height: 180,
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
                                NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'RP ',
                                  decimalDigits: 0
                                ).format(widget.basecamp.price),
                                style: blackTextStyle.copyWith(
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
                                '5%',
                                style: blackTextStyle.copyWith(
                                  fontSize: 14,
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
                                'Asuransi',
                                style: blackTextStyle.copyWith(
                                  fontSize: 12
                                ),
                              ),
                              Text(
                                '10%',
                                style: blackTextStyle.copyWith(
                                  fontSize: 14,
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
                                NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'RP ',
                                  decimalDigits: 0
                                ).format(widget.basecamp.price + widget.basecamp.price * 0.1 + widget.basecamp.price * 0.05),
                                style: blackTextStyle.copyWith(
                                  fontWeight: bold
                                ),
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
      return Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 40),
          child: CustomButton(
            tittle: 'Bayar', 
            onPressed: (){
              forms.add({
                'name' : nameController.text,
                'alamat' : alamatController.text,
                'ktp' : int.tryParse(ktpController.text) ?? 0,
                'noHp' : int.tryParse(noHpController.text) ?? 0,
                'basecamp': widget.basecamp.name,
                'date' : selectedDate,
              });
              Navigator.pushNamed(context, '/main-page');
            }
          ),
        ),
      );
    }

    
    return Scaffold(
      backgroundColor: keybackgroundColor,
      body: ListView(
        children: [
          formPendaki(),
          methodAndSummary(),
          buttonBayar()
        ],
      ),
    );
  }
}