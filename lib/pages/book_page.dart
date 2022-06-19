// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndakikuy/cubit/forms_cubit.dart';
import 'package:ndakikuy/shared/theme.dart';
import 'package:ndakikuy/widgets/custom_riwayat.dart';

import '../models/forms_model.dart';

class BookPage extends StatefulWidget {
  const BookPage({ Key? key }) : super(key: key);

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {

  @override
  void initState() {
    context.read<FormsCubit>().fetchForms();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference forms = firestore.collection('forms');

    Widget riwayaBooking(List<FormsModel> forms) {
      return Column(
        children: forms.map((FormsModel forms){
          return CustomHistory(forms);
        }).toList(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Booking'),
        backgroundColor: keyOrangeColor,
      ),
      body: BlocConsumer<FormsCubit, FormsState>(
        listener: (context, state) {

          if(state is FormsFailed){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: keyOrangeColor,
              )
            );
          }

        },
        builder: (context, state) {
          if(state is FormsSuccess){
            return ListView(
              children: [
                riwayaBooking(state.forms),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}