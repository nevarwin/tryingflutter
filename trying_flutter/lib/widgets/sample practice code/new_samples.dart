import 'package:flutter/material.dart';

class NewSamples extends StatelessWidget {
  const NewSamples({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final subController = TextEditingController();

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
            keyboardType: TextInputType.text,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: subController,
            keyboardType: TextInputType.text,
          ),
          RaisedButton(
            child: Text('Submit'),
            onPressed: () {},
            color: Colors.blue[400],
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
