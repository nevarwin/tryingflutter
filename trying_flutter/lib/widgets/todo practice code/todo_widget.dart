import 'package:flutter/material.dart';
import 'package:trying_flutter/widgets/todo%20practice%20code/new_todo.dart';

import './todo_list.dart';
import '../../models/todo_class.dart';

class TodoWidget extends StatelessWidget {
  TodoWidget({Key? key}) : super(key: key);

  final List<TodoClass> todo = [
    TodoClass(
      id: '1',
      title: 'title1',
      description: 'description1 ',
      date: DateTime.now(),
      color: Colors.teal,
    ),
    TodoClass(
      id: '2',
      title: 'title2',
      description: 'description2 ',
      date: DateTime.now(),
      color: Colors.orangeAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NewTodo(),
        TodoList(
          todo: todo,
        ),
      ],
    );
  }
}
