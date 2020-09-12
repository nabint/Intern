import 'package:flutter/material.dart';
import 'package:userlist/data/model/photo.dart';

class PhotoWidget extends StatelessWidget {
  final Photo photo;

  PhotoWidget({Key key, this.photo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Image.network(
            photo.photoUrl,
            width: 100,
            height: 130.0,
          ),
          Center(child: Text(photo.photoTitle)),
        ],
      ),
    );
  }
}
