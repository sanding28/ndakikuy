// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ndakikuy/shared/theme.dart';

class ProfileCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  const ProfileCard({ 
    Key? key,
    required this.imageUrl,
    required this.name, 
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover)
            ),
          ),
          Text(
            name,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold
            ),
          )
        ],
      ),
    );
  }
}