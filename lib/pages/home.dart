import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userlist/bloc/userlist_bloc.dart';
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
          } else if (state is UserlistInitial) {
            print(state.toString());
            return CircularProgressIndicator();
          } else if (state is UserDetailLoaded) {
            return UserDetail(
              user: state.getUserDetail,
            );
          } else if (state is UserPostsLoaded) {
            return userPostsPage(state.getUserPosts);
          } else {
            return Center(child: Text(state.toString()));
          }
        },
      ),
    );
  }
}

Widget userPostsPage(List<Userpost> postlist) {
  return ListView.builder(
    itemCount: postlist.length,
    itemBuilder: (context, index) {
      return Text(postlist[index].title);
    },
  );
}
