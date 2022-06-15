import 'package:flutter/material.dart';

class NewTodo extends StatelessWidget {
  const NewTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            keyboardType: TextInputType.text,
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Subtitle'),
            keyboardType: TextInputType.text,
            controller: descController,
          ),
          RaisedButton(
            child: Text('Submit'),
            onPressed: () {
              print(descController);
            },
            color: Colors.greenAccent,
            textColor: Colors.black,
          )
        ],
      ),
    );
  }
}
