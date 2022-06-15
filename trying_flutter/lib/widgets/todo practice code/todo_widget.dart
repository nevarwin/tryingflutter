import 'package:flutter/material.dart';
import 'package:trying_flutter/widgets/todo%20practice%20code/new_todo.dart';

import './todo_list.dart';
import '../../models/todo_class.dart';

class TodoWidget extends StatefulWidget {
  TodoWidget({Key? key}) : super(key: key);

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
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

  void _addTodo(
    String title,
    String description,
    DateTime date,
    Color color,
  ) {
    final td = TodoClass(
      id: DateTime.now().toString(),
      title: title,
      description: description,
      date: date,
      color: color,
    );

    setState(() {
      todo.add(td);
    });
  }

  void _changeColor(Color color) {
    Color pickerColor;
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NewTodo(
            todoFunc: _addTodo,
          ),
          const SizedBox(height: 10),
          TodoList(
            todo: todo,
          ),
        ],
      ),
    );
  }
}
