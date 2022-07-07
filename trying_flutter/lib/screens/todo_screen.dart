import 'package:flutter/material.dart';
import 'package:trying_flutter/widgets/todo%20practice%20code/todo_chart.dart';

import '../models/todo_class.dart';
import '../widgets/todo practice code/new_todo.dart';
import '../widgets/todo practice code/todo_list.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<TodoClass> _todo = [
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
      date: DateTime.now().subtract(
        const Duration(days: 4),
      ),
      color: Colors.orangeAccent,
    ),
  ];

  List<TodoClass> get _recentTodo {
    return _todo.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          const Duration(
            days: 7,
          ),
        ),
      );
    }).toList();
  }

  void _addTodo(
    String title,
    String description,
    double number,
    DateTime date,
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
      _todo.add(td);
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
          Expanded(child: TodoChart(recentTodo: _recentTodo)),
          Expanded(child: TodoList(todo: _todo)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () => _showModal(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
