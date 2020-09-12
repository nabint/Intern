import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userlist/bloc/userlist_bloc.dart';
import 'package:userlist/data/model/UserComments.dart';
import 'package:userlist/data/model/UserModel.dart';
import 'package:userlist/pages/userdetail.dart';
import './userPosts.dart';
import './userComments.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserlistBloc userlistBloc;
  var useR;
  var postId;
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
                          useR = user;
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
            return WillPopScope(
              onWillPop: () async {
                print("Back Pressed");
                userlistBloc.add(FetchUserDetail(user: useR));
                return false;
              },
              child: UserPostsPage(
                  postlist: state.getUserPosts, userlistBloc: userlistBloc),
            );
          } else if (state is UserCommentsLoaded) {
            return WillPopScope(
              onWillPop: () async {
                userlistBloc.add(FetchUserPosts(useR.id));
                return false;
              },
              child: UserCommentsPage(state.getUserComments),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
