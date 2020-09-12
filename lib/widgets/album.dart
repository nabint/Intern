import 'package:flutter/material.dart';
import 'package:userlist/pages/photosPage.dart';

class PhotoAlbum extends StatelessWidget {
  final albums;
  PhotoAlbum({this.albums});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              InkWell(
                child: Text(albums[index].albumTitle),
                onTap: () {
                  print("Album ID" + albums[index].id.toString());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PhotosPage(
                        albumid: albums[index].id,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
            ],
          );
        });
  }
}
