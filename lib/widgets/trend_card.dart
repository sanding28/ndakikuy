// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ndakikuy/models/basecamp_model.dart';
import 'package:ndakikuy/pages/details_pages.dart';
import 'package:ndakikuy/shared/theme.dart';

class BasecampTrend extends StatelessWidget {
  final BasecampModel basecamp;
  const BasecampTrend(this.basecamp,{ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 160,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: keyWhiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 2,
            blurRadius: 1,
            offset: const Offset(0, 7), // changes position of shadow
          ),
        ],
      ),
      child: GestureDetector(
        onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailPage(basecamp)));
      },
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
                  image: DecorationImage(image: NetworkImage(basecamp.imageUrl), fit: BoxFit.cover)
                ),
              ),
              SizedBox(height: 12,),
              Text(
                basecamp.name,
                style: blackTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 12
                ),
              ),
              SizedBox(height: 12,),
              Text(
                basecamp.city,
                style: blackTextStyle.copyWith(
                  fontWeight: light,
                  fontSize: 12
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}