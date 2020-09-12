import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/todo.dart';

class TodoRepository {
  Future<List<Todo>> getAllTodos(userId) async {
    String API_URL = "https://jsonplaceholder.typicode.com/users/$userId/todos";
    final result = await http.Client().get(API_URL);
    if (result.statusCode != 200) throw Exception();
    return parsedTodo(result.body);
  }

  List<Todo> parsedTodo(response) {
    List<dynamic> decodedbody = json.decode(response);
    List<Todo> todos = decodedbody.map((item) {
      return Todo.fromJson(item);
    }).toList();
    return todos;
  }
}
