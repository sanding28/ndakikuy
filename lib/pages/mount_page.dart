// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ndakikuy/shared/theme.dart';
import 'package:ndakikuy/widgets/basecamp_new.dart';

class MountPage extends StatelessWidget {
  const MountPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: keyWhiteColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height : 60,
              width : double.infinity,
              margin: EdgeInsets.only(top: 30, right: 24, left: 24, bottom: 30),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.filter_list),
                    onPressed: (){},
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 90, right: 24, left: 24, bottom: 70),
              child: Column(
                children: [
                  BasecampNew(),
                  BasecampNew(),
                  BasecampNew(),
                  BasecampNew(),
                  BasecampNew(),
                  BasecampNew(),
                  BasecampNew(),
                  BasecampNew(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}