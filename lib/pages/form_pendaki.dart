// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:ndakikuy/shared/theme.dart';

class FormPendaki extends StatefulWidget {
  const FormPendaki({ Key? key }) : super(key: key);

  @override
  State<FormPendaki> createState() => _FormPendakiState();
}

class _FormPendakiState extends State<FormPendaki> {

  String _name ='';
  String _alamat ='';
  String _ktp = '';
  String _noHp = '';

  @override
  Widget build(BuildContext context) {

    Widget formPendaki(){
      return Container(
        height: 425,
        width: double.infinity,
        decoration: BoxDecoration(
          color: keybackgroundColor
        ),
        child: Container(
          margin: const EdgeInsets.only(right: 24, left:24),
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
                decoration: const InputDecoration(
                  hintText: 'Full Name'
                ),
                onChanged: (value){
                  _name = value;
                },
              ),
              const SizedBox(height: 20,),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Alamat'
                ),
                onChanged: (value){
                  _alamat = value;
                },
              ),
              const SizedBox(height: 20,),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'No Ktp'
                ),
                onChanged: (value){
                  _ktp = value;
                },
              ),
              const SizedBox(height: 20,),
              TextFormField(
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

    return Scaffold(
      body: SafeArea(child: ListView(
        children: [
          formPendaki(),
        ],
      )),
    );
    
  }
}