import 'package:flutter/material.dart';
import 'package:userlist/data/model/photo.dart';

class PhotoWidget extends StatelessWidget {
  final Photo photo;

  PhotoWidget({Key key, this.photo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            image: DecorationImage(
                image: NetworkImage(photo.photoUrl),
                fit: BoxFit.fitHeight,
                alignment: Alignment.topCenter),
          ),
          // child: Center(
          //     child: Text(
          //   photo.photoTitle,
          //   // style: TextStyle(color: Colors.white),
          // )),
        ));
  }
}
