import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userlist/bloc/userlist_bloc.dart';
import 'package:userlist/data/albumRepository.dart';
import 'package:userlist/data/model/UserModel.dart';
import 'package:userlist/data/model/album.dart';
import 'package:userlist/widgets/user_detail_widget.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/photo_album.dart';

class UserDetail extends StatefulWidget {
  final User user;

  UserDetail({@required this.user});

  @override
  _UserDetailState createState() => _UserDetailState();
  AlbumRepository _albumRepository = new AlbumRepository();
}

class _UserDetailState extends State<UserDetail> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetoptions = <Widget>[
      UserDetailWidget(widget.user),
      FutureBuilder(
          future: widget._albumRepository.getAllAlbums(widget.user.id),
          builder: (BuildContext context, AsyncSnapshot<List<Album>> snapshot) {
            if (snapshot.hasData) {
              List<Album> albums = snapshot.data;
              print(albums);
              return PhotoAlbum(
                albums: albums,
              );
            }
            return CircularProgressIndicator();
          })
    ];
    // ignore: close_sinks
    final userlistBloc = BlocProvider.of<UserlistBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.user.name),
          actions: [
            IconButton(
              icon: Icon(Icons.local_post_office),
              onPressed: () {
                userlistBloc.add(FetchUserPosts(widget.user.id));
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBar(_onItemTapped, _selectedIndex),
        body: widgetoptions[_selectedIndex]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
