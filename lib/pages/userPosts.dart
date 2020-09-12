import 'package:flutter/material.dart';
import 'package:userlist/bloc/userlist_bloc.dart';

class UserPostsPage extends StatelessWidget {
  final postlist;
  final userlistBloc;
  UserPostsPage({this.postlist, this.userlistBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: postlist.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(postlist[index].title),
          subtitle: Text(postlist[index].body),
          onTap: () {
            userlistBloc.add(FetchUserComments(
              postlist[index].id,
            ));
          },
        );
        // return Text(postlist[index].title);
      },
    ));
  }
}
