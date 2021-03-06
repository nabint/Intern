import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userlist/bloc/userlist_bloc.dart';
import 'package:userlist/data/albumRepository.dart';
import 'package:userlist/data/model/UserModel.dart';
import 'package:userlist/data/model/album.dart';
import 'package:userlist/data/model/todo.dart';
import 'package:userlist/data/todoRepository.dart';
import 'package:userlist/widgets/todo_widget.dart';
import 'package:userlist/widgets/user_detail_widget.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/album_widget.dart';

class UserDetail extends StatefulWidget {
  final User user;

  UserDetail({@required this.user});

  @override
  _UserDetailState createState() => _UserDetailState();
  AlbumRepository _albumRepository = new AlbumRepository();
  TodoRepository todoRepo = new TodoRepository();
}

class _UserDetailState extends State<UserDetail> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetoptions = <Widget>[
      UserDetailWidget(widget.user),
      albumPage(),
      todoPage()
    ];
    Widget floatingActionBtn;
    // ignore: close_sinks
    final userlistBloc = BlocProvider.of<UserlistBloc>(context);
    if (_selectedIndex == 2) {
      print("index is 2");

      floatingActionBtn = FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add,
          size: 20,
        ),
        onPressed: () {},
      );
    } else {
      floatingActionBtn = Container();
    }
    return Scaffold(
        floatingActionButton: floatingActionBtn,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            widget.user.name,
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Center(
              child: Text(
                "Posts",
                style: TextStyle(color: Colors.black),
              ),
            ),
            IconButton(
              iconSize: 40,
              icon: Icon(
                Icons.toc,
                color: Colors.black,
              ),
              onPressed: () {
                userlistBloc.add(FetchUserPosts(widget.user.id));
              },
            ),
          ],
        ),
        bottomNavigationBar:
            AnimatedBottomNavBar(_onItemTapped, _selectedIndex),
        body: widgetoptions[_selectedIndex]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget albumPage() {
    return FutureBuilder(
        future: widget._albumRepository.getAllAlbums(widget.user.id),
        builder: (BuildContext context, AsyncSnapshot<List<Album>> snapshot) {
          if (snapshot.hasData) {
            List<Album> albums = snapshot.data;
            print(albums);
            return PhotoAlbum(
              albums: albums,
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget todoPage() {
    return FutureBuilder(
        future: widget.todoRepo.getAllTodos(widget.user.id),
        builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
          if (snapshot.hasData) {
            List<Todo> todos = snapshot.data;
            // print(albums);
            return Todos(
              todolist: todos,
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
