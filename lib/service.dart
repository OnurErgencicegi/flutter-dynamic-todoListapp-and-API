import 'dart:convert';
import 'package:todolistapp/model/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {
  final String url = "https://dummyjson.com/todos/";
  final String addUrl = "https://dummyjson.com/todos/add";

  Future<List<Todo>> getTodos() async {
    final response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(response.body)["todos"];
    List<Todo> todos = List.empty(growable: true);

    for (var element in resp) {
      Todo task = Todo.fromJson(element);

      if (task.completed! == false) {
        todos.add(task);
      }
    }
    return todos;
  }

  Future<List<Todo>> completedTodos() async {
    final response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(response.body)["todos"];
    List<Todo> todos = List.empty(growable: true);

    for (var element in resp) {
      Todo task = Todo.fromJson(element);

      if (task.completed! == true) {
        todos.add(task);
      }
    }
    return todos;
  }

  Future<String> addTodo(Todo newTodo) async {
    final response = await http.post(
      Uri.parse(addUrl),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: jsonEncode(newTodo.toJson()),
    );
    return response.body;
  }
}
