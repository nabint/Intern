import 'package:flutter/material.dart';
import 'package:userlist/pages/photosPage.dart';

class PhotoAlbum extends StatelessWidget {
  final albums;
  PhotoAlbum({this.albums});
  List<String> colors = [
    "#4D83BF",
    "#D46960",
    "#E6BF73",
    "#68B5B0",
    "#808DDE",
    "#e76eb1",
    "#b08069",
    "#4D83BF",
    "#E6BF73",
    "#D46960",
    "#e76eb1",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        elevation: 2.0,
        child: ListView.builder(
            itemCount: albums.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      child: Container(
                          height: 70,
                          //
                          decoration: BoxDecoration(
                            color: hexToColor(colors[index]),
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              albums[index].albumTitle,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ))),
                      onTap: () {
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
                      height: 5,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
