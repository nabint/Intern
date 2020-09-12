import './model/album.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AlbumRepository {
  Future<List<Album>> getAllAlbums(userId) async {
    String API_URL =
        "https://jsonplaceholder.typicode.com/users/$userId/albums";
    final result = await http.Client().get(API_URL);
    if (result.statusCode != 200) throw Exception();

    return parsedAlbum(result.body);
  }

  List<Album> parsedAlbum(response) {
    List<dynamic> decodedbody = json.decode(response);
    print("decoded body" + decodedbody.toString());
    List<Album> albums = decodedbody.map((item) {
      return Album.fromJson(item);
    }).toList();
    return albums;
  }
}
