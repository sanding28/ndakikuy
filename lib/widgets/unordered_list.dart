import 'package:flutter/material.dart';
import 'package:ndakikuy/shared/theme.dart';

class UnordredList extends StatelessWidget {

  final String tittle;

  const UnordredList({ Key? key, required this.tittle }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text:TextSpan(
        text: '• ',
        style: blackTextStyle.copyWith(
          fontWeight: bold,
          fontSize: 14
        ),
        children: [
          TextSpan(text: tittle, 
          style: blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: light
          )
          )
        ]
      )
    );
  }
}