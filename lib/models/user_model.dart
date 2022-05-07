// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {

  final String id;
  final String email;
  final String password;
  final String name;

  UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.name
  });
  @override
  List<Object?> get props =>[
    id,
    email,
    password,
    name,
  ];
  
}