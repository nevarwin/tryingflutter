import 'package:flutter/material.dart';

class NewTodo extends StatelessWidget {
  const NewTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();

    return Card(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            keyboardType: TextInputType.text,
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            keyboardType: TextInputType.text,
            controller: descController,
          ),
          RaisedButton(
            onPressed: () {
              print(descController);
            },
            color: Colors.greenAccent,
          )
        ],
      ),
    );
  }
}
