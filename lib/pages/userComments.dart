import 'package:flutter/material.dart';

class UserCommentsPage extends StatelessWidget {
  final commentlist;
  UserCommentsPage(this.commentlist);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: commentlist.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Name ' + commentlist[index].name),
              SizedBox(
                height: 7,
              ),
              Text('Email ' + commentlist[index].email),
              SizedBox(
                height: 7,
              ),
              Text('Body ' + commentlist[index].body),
              SizedBox(
                height: 30,
              ),
            ],
          );
        },
      ),
    );
  }
}
