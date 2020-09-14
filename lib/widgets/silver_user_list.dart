import 'package:flutter/material.dart';
import 'package:userlist/bloc/userlist_bloc.dart';
import 'user_widget.dart';

class SliverUserList extends StatelessWidget {
  final users;
  final userlistBloc;
  SliverUserList(this.users, this.userlistBloc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F1F1),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            onStretchTrigger: () {
              print("Strected");
            },
            backgroundColor: Colors.white,
            floating: false,
            pinned: true,
            expandedHeight: 132.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "UserList",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return ListTile(
                title: UserWidget(users[index].name),
                onTap: () {
                  userlistBloc.add(FetchUserDetail(user: users[index]));
                },
              );
            }, childCount: users.length),
          ),
        ],
      ),
    );
  }
}
