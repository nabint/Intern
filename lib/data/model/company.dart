import 'package:flutter/foundation.dart';

class Company {
  final String companyname;
  final String catchPhrase;
  final String bs;

  Company({
    @required this.companyname,
    @required this.catchPhrase,
    @required this.bs,
  });
  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      companyname: json['company'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }
}
