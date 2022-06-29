import 'package:flutter/material.dart';

import '../models/todo_class.dart';
import '../widgets/todo practice code/new_todo.dart';
import '../widgets/todo practice code/todo_list.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<TodoClass> todo = [
    TodoClass(
      id: '1',
      title: 'title1',
      description: 'description1 ',
      number: 1,
      date: DateTime.now(),
      color: Colors.teal,
    ),
    TodoClass(
      id: '2',
      title: 'title2',
      description: 'description2 ',
      number: 1,
      date: DateTime.now(),
      color: Colors.orangeAccent,
    ),
  ];

  void _addTodo(
    String title,
    String description,
    DateTime date,
    int number,
    Color color,
  ) {
    final td = TodoClass(
      id: DateTime.now().toString(),
      title: title,
      description: description,
      number: number,
      date: date,
      color: color,
    );

    setState(() {
      todo.add(td);
    });
  }

  void _showModal() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return NewTodo(
          todoFunc: _addTodo,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10),
          TodoList(
            todo: todo,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreenAccent,
        onPressed: () => _showModal(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
