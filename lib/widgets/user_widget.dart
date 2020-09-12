import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  final name;
  UserWidget(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      // width: double.infinity,
      height: 110,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              // border: Border.all(width: 3, color: secondary),
            ),
            child: Icon(
              Icons.person,
              size: 50,
            ),
          ),
          Text(name),
        ],
      ),
    );
  }
}
