import 'package:flutter/foundation.dart';

class Geo {
  final String lat;
  final String lng;

  Geo({
    @required this.lat,
    @required this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lng: json['lat'],
      lat: json['lng'],
    );
  }
}
