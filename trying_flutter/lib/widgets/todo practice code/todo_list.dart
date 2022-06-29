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
    return todo.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 300,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Nothing',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          )
        : Expanded(
            child: ListView.builder(
              itemCount: todo.length,
              itemBuilder: ((context, index) {
                return Card(
                  child: ListTile(
                    tileColor: Colors.white70,
                    style: ListTileStyle.list,
                    title: Text(
                      todo[index].title,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 3.0,
                          ),
                          child: Text(
                            todo[index].description,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Text(
                          DateFormat.yMEd().format(DateTime.now()),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                    leading: CircleAvatar(
                      backgroundColor: todo[index].color,
                    ),
                  ),
                );
              }),
            ),
          );
  }
}
