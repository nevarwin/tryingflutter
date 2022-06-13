import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/todo_class.dart';

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
