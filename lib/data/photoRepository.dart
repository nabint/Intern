import './model/photo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PhotoRepository {
  Future<List<Photo>> getAllPhotos(albumId) async {
    String API_URL =
        "https://jsonplaceholder.typicode.com/albums/$albumId/photos";
    final result = await http.Client().get(API_URL);
    if (result.statusCode != 200) throw Exception();

    return parsedPhoto(result.body);
  }

  List<Photo> parsedPhoto(response) {
    List<dynamic> decodedbody = json.decode(response);
    List<Photo> photos = decodedbody.map((item) {
      return Photo.fromJson(item);
    }).toList();
    return photos;
  }
}
