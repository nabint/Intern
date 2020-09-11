import 'package:http/http.dart' as http;
import 'package:userlist/data/model/UserComments.dart';
import 'package:userlist/data/model/UserPosts.dart';
import 'dart:convert';

import 'model/UserModel.dart';

class UserRepository {
  Future<List<User>> getAllUser() async {
    final result =
        await http.Client().get("https://jsonplaceholder.typicode.com/users/");
    if (result.statusCode != 200) throw Exception();
    // print(result.body);
    return parsedUser(result.body);
  }

  List<User> parsedUser(response) {
    List decodedbody = json.decode(response);
    List<User> users = decodedbody.map((item) {
      return User.fromJson(item);
    }).toList();
    print(users);
    return users;
  }

  Future<List<Userpost>> getUserPost(int id) async {
    final result = await http.Client()
        .get("https://jsonplaceholder.typicode.com/users/$id/posts");
    if (result.statusCode != 200) throw Exception();
    return parsedUserPost(result.body);
  }

  List<Userpost> parsedUserPost(response) {
    List decodedbody = json.decode(response);
    List<Userpost> userposts =
        decodedbody.map((item) => Userpost.fromJson(item)).toList();
    print(userposts);
    return userposts;
  }

  Future<List<UserComment>> getUserComments(int postid) async {
    final result = await http.Client()
        .get("https://jsonplaceholder.typicode.com/posts/$postid/comments");
    if (result.statusCode != 200) throw Exception();
    return parsedUserComments(result.body);
  }

  List<UserComment> parsedUserComments(response) {
    List decodedbody = json.decode(response);
    List<UserComment> userComments =
        decodedbody.map((item) => UserComment.fromJson(item)).toList();
    return userComments;
  }
}
