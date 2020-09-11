import 'package:flutter/foundation.dart';
import 'package:userlist/data/model/geo.dart';

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({
    @required this.street,
    @required this.suite,
    @required this.city,
    @required this.zipcode,
    @required this.geo,
  });
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      city: json['city'],
      suite: json['suite'],
      zipcode: json['zipcode'],
      geo: Geo.fromJson(json['geo']),
    );
  }
}
