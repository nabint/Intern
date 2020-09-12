import 'package:flutter/material.dart';

class PhotoAlbum extends StatelessWidget {
  final albums;
  PhotoAlbum({this.albums});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          return Text(albums[index].albumTitle);
        });
  }
}
