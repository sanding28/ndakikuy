//Belum atau sepertinya tidak terpakai

import 'package:equatable/equatable.dart';
import 'package:ndakikuy/models/basecamp_model.dart';

class TransactionsModel extends Equatable{

  final BasecampModel basecamp;
  final String fullName;
  final String address;
  final String noKtp;
  final String phone;
  final int price;
  final int totalPrice;

  const TransactionsModel({
    required this.basecamp,
    this.fullName ='',
    this.address ='',
    this.noKtp ='',
    this.phone ='',
    this.price = 0,
    this.totalPrice = 0,
  });

  @override
  List<Object?> get props => [
    basecamp,
    fullName,
    address,
    noKtp,
    phone,
    price,
    totalPrice,
  ];
}