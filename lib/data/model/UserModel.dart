import 'package:flutter/foundation.dart';
import 'package:userlist/data/model/address.dart';
import 'package:userlist/data/model/company.dart';

class Users {
  final int id;
  final String name;
  final String username;
  final String email;

  final Address address;

  final String phone;
  final String website;

  final Company company;

  Users({
    @required this.email,
    @required this.id,
    @required this.username,
    @required this.name,
    @required this.phone,
    @required this.address,
    @required this.company,
    @required this.website,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      email: json['email'],
      id: json['id'],
      username: json['username'],
      name: json['name'],
      phone: json['phone'],
      address: Address.fromJson(json['address']),
      company: Company.fromJson(json['company']),
      website: json['website'] as String,
    );
  }
}
