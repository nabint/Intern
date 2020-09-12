import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:userlist/data/model/UserComments.dart';
import 'package:userlist/data/model/UserPosts.dart';
import 'dart:convert';

import 'model/UserModel.dart';

class UserRepository {
  Future<List<User>> getAllUser() async {
    String API_URL = "https://jsonplaceholder.typicode.com/users/";
    var cacheDir = await getTemporaryDirectory();
    String fileName = "UserData.json";
    if (await File(cacheDir.path + "/" + fileName).exists()) {
      var response = File(cacheDir.path + "/" + fileName).readAsStringSync();
      return parsedUser(response);
    } else {
      print("Loading from API");
      final result = await http.Client().get(API_URL);
      if (result.statusCode != 200) throw Exception();
      // print(result.body);
      //Saving to Cache
      var tempDir = await getTemporaryDirectory();
      File file = new File(tempDir.path + "/" + fileName);
      file.writeAsString(result.body, flush: true, mode: FileMode.write);

      return parsedUser(result.body);
    }
  }

  List<User> parsedUser(response) {
    List decodedbody = json.decode(response);
    List<User> users = decodedbody.map((item) {
      return User.fromJson(item);
    }).toList();
    return users;
  }

  Future<List<Userpost>> getUserPost(int id) async {
    final String APIURL =
        "https://jsonplaceholder.typicode.com/users/$id/posts";
    var cacheDir = await getTemporaryDirectory();

    String fileName = "UserPosts.json";
    if (await File(cacheDir.path + "/" + fileName).exists()) {
      print("Loading from Cache");
      var response = File(cacheDir.path + "/" + fileName).readAsStringSync();
      return parsedUserPost(response);
    } else {
      print("Loading from API");
      final result = await http.Client().get(APIURL);
      if (result.statusCode != 200) throw Exception();
      //Saving to cache
      var tempDir = await getTemporaryDirectory();
      File file = new File(tempDir.path + "/" + fileName);
      file.writeAsString(result.body, flush: true, mode: FileMode.write);

      return parsedUserPost(result.body);
    }
  }

  List<Userpost> parsedUserPost(response) {
    List decodedbody = json.decode(response);
    List<Userpost> userposts =
        decodedbody.map((item) => Userpost.fromJson(item)).toList();
    print(userposts);
    return userposts;
  }

  Future<List<UserComment>> getUserComments(int postid) async {
    final String APIURL =
        "https://jsonplaceholder.typicode.com/posts/$postid/comments";
    var cacheDir = await getTemporaryDirectory();

    String fileName = "UserComments.json";
    if (await File(cacheDir.path + "/" + fileName).exists()) {
      print("Loading from Cache");
      var response = File(cacheDir.path + "/" + fileName).readAsStringSync();
      return parsedUserComments(response);
    } else {
      print("Loading from API");
      final result = await http.Client().get(APIURL);
      if (result.statusCode != 200) throw Exception();
      //Saving to cache
      var tempDir = await getTemporaryDirectory();
      File file = new File(tempDir.path + "/" + fileName);
      file.writeAsString(result.body, flush: true, mode: FileMode.write);

      return parsedUserComments(result.body);
    }
  }

  List<UserComment> parsedUserComments(response) {
    List decodedbody = json.decode(response);
    List<UserComment> userComments =
        decodedbody.map((item) => UserComment.fromJson(item)).toList();
    return userComments;
  }
}
