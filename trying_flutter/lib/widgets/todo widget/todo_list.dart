import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/todo_class.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    Key? key,
    required this.todo,
  }) : super(key: key);
  final List<TodoClass> todo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: todo.map((todo) {
        return ListTile(
          tileColor: Colors.white70,
          style: ListTileStyle.list,
          title: Text(
            todo.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          subtitle: Text(
            todo.description +
                DateFormat.yMEd().format(
                  DateTime.now(),
                ),
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          leading: CircleAvatar(
            backgroundColor: todo.color,
          ),
        );
      }).toList(),
    );
  }
}
