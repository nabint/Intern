import 'package:flutter/foundation.dart';

class UserComment {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  UserComment({
    @required this.postId,
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.body,
  });

  factory UserComment.fromJson(Map<String, dynamic> json) {
    return UserComment(
      postId: json['postId'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      body: json['body'] as String,
    );
  }
}
