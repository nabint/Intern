import 'package:flutter/foundation.dart';

class Userpost {
  final int userId;
  final int id;
  final String title;
  final String body;

  Userpost({
    @required this.userId,
    @required this.id,
    @required this.title,
    @required this.body,
  });

  factory Userpost.fromJson(Map<String, dynamic> json) {
    return Userpost(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
