// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ndakikuy/cubit/basecamp_cubit.dart';
import 'package:ndakikuy/models/basecamp_model.dart';
import 'package:ndakikuy/shared/theme.dart';
import 'package:ndakikuy/widgets/basecamp_new.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MountPage extends StatefulWidget {
  const MountPage({ Key? key }) : super(key: key);

  @override
  State<MountPage> createState() => _MountPageState();
}

class _MountPageState extends State<MountPage> {

  @override
  void initState() {
    context.read<BasecampCubit>().fetchBasecamp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget listMount(List<BasecampModel> basecamp){
      return Container(
        margin: EdgeInsets.only(top: 70, left: 24, right: 24, bottom: 50),
        child: Column(
              children: basecamp.map((BasecampModel basecamp) {
                return BasecampNew(basecamp);
              }).toList(),
            ),
      );
    }
    return BlocConsumer<BasecampCubit, BasecampState>(
      listener: (context, state) {
        if(state is BasecampFailed){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: keyOrangeColor,
              content: Text(state.error),
            )
          );
        }
      },
      builder: (context, state) {
        if(state is BasecampSuccess) {
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
                  listMount(state.basecamp)
                ],
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}