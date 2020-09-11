import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userlist/bloc/userlist_bloc.dart';
import 'package:userlist/data/model/UserModel.dart';

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

    return ListView(
      children: <Widget>[
        Container(
          child: BlocBuilder<UserlistBloc, UserlistState>(
            bloc: userlistBloc,
            builder: (context, state) {
              if (state is UserlistLoaded) {
                print(state.toString());
                return ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: state.getUsers
                      .map((Users users) => ListTile(
                            title: Text(
                              users.id.toString(),
                            ),
                            subtitle: Text(users.name),
                          ))
                      .toList(),
                );
              } else if (state is UserlistInitial) {
                print(state.toString());
                return CircularProgressIndicator();
              } else {
                return Center(child: Text(state.toString()));
              }
            },
          ),
        ),
      ],
    );
  }
}
