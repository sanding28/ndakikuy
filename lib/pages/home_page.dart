// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndakikuy/cubit/auth_cubit.dart';
import 'package:ndakikuy/cubit/basecamp_cubit.dart';
import 'package:ndakikuy/pages/mount_page.dart';
import 'package:ndakikuy/shared/theme.dart';
import 'package:ndakikuy/widgets/basecamp_new.dart';
import 'package:ndakikuy/widgets/trend_card.dart';

import '../models/basecamp_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    AlanVoice.addButton("3129f8ead41d7ca7329eed5b83c76f592e956eca572e1d8b807a3e2338fdd0dc/stage", buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);

  /// Handle commands from Alan Studio
    AlanVoice.onCommand.add((command) => _handleCommand(command.data));
    context.read<BasecampCubit>().fetchBasecamp();
    super.initState();
  }

  void _handleCommand(Map<String, dynamic> command){
    switch (command['command']) {
      case 'mountList':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MountPage()));
        break;
      case 'back':
        Navigator.pop(context);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {

    Widget topBanner(){
      return Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: keyWhiteColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthSuccess) {
                  return Container(
                  margin: EdgeInsets.only(left: defaultMargin, top: 30 ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello,\n${state.user.name}',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 20
                        ),
                      ),
                      SizedBox(height: 2,),
                      Text(
                        'Mau mendaki ke mana hari ini?',
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: light
                        ),
                      )
                    ],
                  ),
                );
                } else{
                  return Container();
                }
              },
            ),
          ],
        ),
      );
    }
    
    Widget basecampTrend(List<BasecampModel> basecamp){
      return Container(
        height: 291,
        margin: EdgeInsets.only(left: 24, top: 130),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 16,
              width: 180,
              child: Row(
                children: [
                  Text(
                    'Sedang trend saat ini',
                    style: blackTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 14
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 255,
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: basecamp.map((BasecampModel basecamp) {
                    return BasecampTrend(basecamp);
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget basecampNew(List<BasecampModel> basecamp){
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 24, top: 440, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 16,
              child: Row(
                children: [
                  Text(
                    'Baru bergabung',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold
                    ),
                  )
                ],
              )
            ),
            Column(
              children: basecamp.map((BasecampModel basecamp) {
                return BasecampNew(basecamp);
              }).toList(),
            )
          ],
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
        if(state is BasecampSuccess){
          return Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                topBanner(),
                basecampTrend(state.basecamp),
                basecampNew(state.basecamp)
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