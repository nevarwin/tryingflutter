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
    return Expanded(
      child: ListView.builder(
        itemCount: todo.length,
        itemBuilder: ((context, index) {
          return ListTile(
            tileColor: Colors.white70,
            style: ListTileStyle.list,
            title: Text(
              todo[index].title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              todo[index].description +
                  DateFormat.yMEd().format(DateTime.now()),
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: todo[index].color,
            ),
          );
        }),
      ),
    );
  }
}
