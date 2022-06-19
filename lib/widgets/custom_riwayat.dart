// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ndakikuy/models/forms_model.dart';

import '../shared/theme.dart';

class CustomHistory extends StatelessWidget {
  
  final FormsModel forms;
  const CustomHistory(this.forms,{Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    
    return Container(
      height: MediaQuery.of(context).size.height * 0.11,
      margin: EdgeInsets.only(top : 20, right: 20, left: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: keyOrangeColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Tujuan : ',
                style: blackTextStyle
              ),
              Text(
                forms.basecamp,
                style: blackTextStyle
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                'Tanggal : ${DateFormat('dd MMMM yyyy').format(forms.date)}',
                style: blackTextStyle
              ),
              // Text(
              //   '',
              //   style: blackTextStyle
              // )
            ],
          ),
        ],
      ),
    );
  }
}