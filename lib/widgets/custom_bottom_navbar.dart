// ignore_for_file: prefer_const_constructors
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ndakikuy/cubit/page_cubit.dart';
import 'package:ndakikuy/shared/theme.dart';

class CustomNavbar extends StatelessWidget {

  final String imgaeUrl;
  final int index;

  const CustomNavbar({ 
    Key? key,
    required this.imgaeUrl,
    required this.index, 
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        children: [
          Image.asset(
            imgaeUrl,
            height: 22,
            width: 22,
            color: context.read<PageCubit>().state == index ? keyPrimaryColor : Colors.black,
          )
          // Container(
          //   height: 20,
          //   width: 20,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(image: AssetImage(imgaeUrl))
          //   ),
          // ),
        ],
      ),
    );
  }
}