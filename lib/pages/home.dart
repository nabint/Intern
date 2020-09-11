import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userlist/bloc/userlist_bloc.dart';
import 'package:userlist/data/model/UserComments.dart';
import 'package:userlist/data/model/UserModel.dart';
import 'package:userlist/data/model/UserPosts.dart';
import 'package:userlist/pages/userdetail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserlistBloc userlistBloc;
  @override
  void initState() {
    userlistBloc = BlocProvider.of<UserlistBloc>(context);
    userlistBloc.add(FetchAllUsers());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks

    return Container(
      child: BlocBuilder<UserlistBloc, UserlistState>(
        bloc: userlistBloc,
        builder: (context, state) {
          if (state is UserlistLoaded) {
            print(state.toString());
            return ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: state.getUser
                  .map((User user) => ListTile(
                        title: Text(
                          user.id.toString(),
                        ),
                        subtitle: Text(user.name),
                        onTap: () {
                          userlistBloc.add(FetchUserDetail(user: user));
                        },
                      ))
                  .toList(),
            );
          } else if (state is UserDetailLoaded) {
            return new WillPopScope(
              onWillPop: () async {
                print("Back Pressed");
                userlistBloc.add(FetchAllUsers());
                return false;
              },
              child: UserDetail(
                user: state.getUserDetail,
              ),
            );
          } else if (state is UserPostsLoaded) {
            return userPostsPage(state.getUserPosts, userlistBloc);
          } else if (state is UserCommentsLoaded) {
            return userCommentsPage(state.getUserComments);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Widget userPostsPage(List<Userpost> postlist, UserlistBloc userlistBloc) {
  return ListView.builder(
    itemCount: postlist.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(postlist[index].title),
        subtitle: Text(postlist[index].body),
        onTap: () {
          userlistBloc.add(FetchUserComments(postlist[index].id));
          print("poror");
        },
      );
      // return Text(postlist[index].title);
    },
  );
}

Widget userCommentsPage(List<UserComment> commentlist) {
  print(commentlist[0]);
  return ListView.builder(
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
      // return Text(postlist[index].title);
    },
  );
}
