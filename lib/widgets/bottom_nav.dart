import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final Function ontapPressed;
  final _selectedIndex;
  BottomNavBar(this.ontapPressed, this._selectedIndex);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: ontapPressed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color.fromARGB(255, 0, 0, 0)),
            title: Text(
              'Details',
              style: TextStyle(color: Colors.black),
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.photo_album, color: Color.fromARGB(255, 0, 0, 0)),
            title: new Text('Albums')),
        BottomNavigationBarItem(
            icon: Icon(Icons.assignment, color: Color.fromARGB(255, 0, 0, 0)),
            title: new Text('Todos')),
      ],
    );
  }
}
