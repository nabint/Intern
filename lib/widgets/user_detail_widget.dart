import 'package:flutter/material.dart';

class UserDetailWidget extends StatelessWidget {
  final user;
  UserDetailWidget(this.user);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          elevation: 2,
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
    );
  }
}
