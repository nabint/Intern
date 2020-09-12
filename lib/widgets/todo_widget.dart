import 'package:flutter/material.dart';

class Todos extends StatelessWidget {
  final todolist;

  Todos({Key key, this.todolist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(todolist[index].title),
              SizedBox(
                height: 10,
              ),
              Text(todolist[index].completed.toString()),
              SizedBox(
                height: 30,
              ),
            ],
          );
        });
  }
}
