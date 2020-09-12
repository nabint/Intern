import 'package:flutter/material.dart';
import 'package:userlist/data/photoRepository.dart';
import 'package:userlist/widgets/photo_widget.dart';

class PhotosPage extends StatelessWidget {
  final albumid;
  final PhotoRepository _photoRepository = PhotoRepository();
  PhotosPage({Key key, this.albumid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: FutureBuilder(
        future: _photoRepository.getAllPhotos(albumid),
        // ignore: missing_return
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            List photos = snapshot.data;
            return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.80,
              children: List.generate(
                  photos.length,
                  (index) => PhotoWidget(
                        photo: photos[index],
                      )),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
