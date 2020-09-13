import 'package:flutter/material.dart';
import 'package:userlist/bloc/userlist_bloc.dart';

class UserPostsPage extends StatelessWidget {
  final postlist;
  final userlistBloc;
  UserPostsPage({this.postlist, this.userlistBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              "Posts",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: postlist.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5.0,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                      child: Text(
                    postlist[index].title,
                    style: TextStyle(fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                  )),
                ),
                subtitle: Text(
                  postlist[index].body,
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () {
                  userlistBloc.add(FetchUserComments(
                    postlist[index].id,
                  ));
                },
              ),
            );
            // return Text(postlist[index].title);
          },
        ));
  }
}
