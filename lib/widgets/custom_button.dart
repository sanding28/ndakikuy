import 'package:flutter/material.dart';
import 'package:ndakikuy/shared/theme.dart';

class CustomButton extends StatelessWidget {

  final String tittle;
  final double width;
  final Function() onPressed;
  final EdgeInsets margin;

  const CustomButton({ 
    Key? key,
    required this.tittle,
    this.width = 193,
    required this.onPressed,
    this.margin = EdgeInsets.zero 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: 51,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: btnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15) 
          ),
        ),
        child: 
        Text(
          tittle,
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium
          ),
        )
      ),
    );
  }
}