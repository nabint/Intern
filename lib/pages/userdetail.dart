import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userlist/bloc/userlist_bloc.dart';
import 'package:userlist/data/model/UserModel.dart';

class UserDetail extends StatelessWidget {
  final User user;

  UserDetail({@required this.user});

  @override
  Widget build(BuildContext context) {
    final userlistBloc = BlocProvider.of<UserlistBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        actions: [
          IconButton(
            icon: Icon(Icons.local_post_office),
            onPressed: () {
              print("user id is" + user.id.toString());
              userlistBloc.add(FetchUserPosts(user.id));
            },
          ),
          IconButton(
            icon: Icon(Icons.comment),
            // onPressed: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => CommentList()),
            //   );
            // },
            onPressed: () {},
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.delete),
      //   onPressed: () async {
      //     await httpService.deletePost(user.id);
      //   },
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: Text("ID"),
                  subtitle: Text("${user.id}"),
                ),
                ListTile(
                  title: Text("Name"),
                  subtitle: Text(user.name),
                ),
                ListTile(
                  title: Text("Username"),
                  subtitle: Text(user.username),
                ),
                ListTile(
                  title: Text("Email"),
                  subtitle: Text(user.email),
                ),
                ListTile(
                  title: Text("Phone"),
                  subtitle: Text(user.phone),
                ),
                ListTile(
                  title: Text("Street"),
                  subtitle: Text(user.address.street),
                ),
                ListTile(
                  title: Text("Geo"),
                  subtitle: Text(user.address.geo.lat),
                ),
                ListTile(
                  title: Text("Website"),
                  subtitle: Text(user.website),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
