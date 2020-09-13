import 'package:flutter/material.dart';

class UserCommentsPage extends StatelessWidget {
  final commentlist;
  UserCommentsPage(this.commentlist);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Comments",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: commentlist.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    commentlist[index].name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  commentlist[index].email,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  commentlist[index].body,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
