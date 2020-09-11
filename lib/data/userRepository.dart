import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/UserModel.dart';

class UserRepository {
  Future<List<Users>> getAllUser() async {
    final result =
        await http.Client().get("https://jsonplaceholder.typicode.com/users/");
    if (result.statusCode != 200) throw Exception();
    // print(result.body);
    return parsedUsers(result.body);
  }

  List<Users> parsedUsers(response) {
    List decodedbody = json.decode(response);
    List<Users> users =
        decodedbody.map((dynamic item) => Users.fromJson(item)).toList();
    // List<dynamic> users = decodedbody.map((item) {
    // Users.fromJson(item);
    // }).toList();
    print(users);
    return users;
  }
}
