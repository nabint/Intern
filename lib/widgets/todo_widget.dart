import 'package:flutter/material.dart';

class Todos extends StatelessWidget {
  final todolist;

  Todos({Key key, this.todolist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget icon;

    return ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (context, index) {
          icon = todolist[index].completed
              ? Icon(
                  Icons.check_box,
                  color: Colors.green,
                  size: 32,
                )
              : Icon(
                  Icons.check_box_outline_blank,
                  color: Colors.green,
                  size: 29,
                );
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
            child: Card(
              elevation: 2.0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
                child: Container(
                    height: 70,
                    //
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(flex: 4, child: Text(todolist[index].title)),
                        Flexible(flex: 1, child: icon),
                      ],
                    )),
              ),
            ),
          );
        });
  }
}
// Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(todolist[index].title),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(todolist[index].completed.toString()),
//               SizedBox(
//                 height: 30,
//               ),
//             ],
//           );
