
import 'package:equatable/equatable.dart';

class FormsModel extends Equatable{

  // final String id;
  final String alamat;
  final String basecamp;
  final DateTime date;
  final int ktp;
  final String name;
  final int noHp;

  FormsModel({
    // required this.id,
    this.basecamp = '',
    required this.date,
    this.alamat = '',
    this.name = '',
    this.ktp = 0,
    this.noHp = 0,
  });

  factory FormsModel.fromjson(String id, Map<String, dynamic> json) {
    return FormsModel(
      // id: json['id'],
      basecamp: json['basecamp'],
      date: json['date'].toDate(),
      alamat: json['alamat'],
      name: json['name'],
      ktp: json['ktp'],
      noHp: json['noHp'],
    );
  }

  @override
  
  List<Object?> get props => [date, ktp, noHp, alamat, basecamp, name];
  
}