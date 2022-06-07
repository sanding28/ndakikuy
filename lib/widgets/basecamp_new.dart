import 'package:flutter/material.dart';
import 'package:ndakikuy/models/basecamp_model.dart';
import 'package:ndakikuy/pages/details_pages.dart';
import 'package:ndakikuy/shared/theme.dart';

class BasecampNew extends StatelessWidget {

  final BasecampModel basecamp;
  const BasecampNew(this.basecamp,{ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailPage(basecamp)));
      },
      child: Container(
        height: 90,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: keyWhiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 2,
              blurRadius: 1,
              offset: const Offset(0, 7), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 120,
              margin: const EdgeInsets.only( top: 10, bottom: 10, left: 12, right: 12),
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(basecamp.imageUrl), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              height: 70,
              margin: const EdgeInsets.only( top: 16),
              width: 168,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    basecamp.name,
                    style: blackTextStyle.copyWith(
                      fontSize :14,
                      fontWeight: bold
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Text(
                    basecamp.city,
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}