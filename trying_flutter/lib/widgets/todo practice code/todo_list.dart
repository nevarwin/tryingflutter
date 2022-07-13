import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/todo_class.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    Key? key,
    required this.todo,
    required this.delete,
  }) : super(key: key);
  final List<TodoClass> todo;
  final Function delete;

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
        : ListView.builder(
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
                      Text(todo[index].number.toString()),
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
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                    ),
                    onPressed: () {
                      delete(todo[index].id);
                    },
                  ),
                ),
              );
            }),
          );
  }
}
