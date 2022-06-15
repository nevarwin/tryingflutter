import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';

class NewTodo extends StatelessWidget {
  const NewTodo({
    Key? key,
    required this.todoFunc,
  }) : super(key: key);

  final Function todoFunc;

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();
    final dateController = TextEditingController();

    Color? pickedColor;

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
          TextField(
            readOnly: true,
            controller: dateController,
            decoration: InputDecoration(labelText: 'Date'),
            onTap: () async {
              var date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              dateController.text = date.toString().substring(0, 10);
            },
          ),
          BlockPicker(
            pickerColor: Colors.blue,
            onColorChanged: (color) {
              pickedColor = color;
            },
          ),
          RaisedButton(
            child: Text('Submit'),
            onPressed: () {
              todoFunc(
                titleController.text,
                descController.text,
                DateTime.parse(dateController.text),
                pickedColor,
              );
            },
            color: Colors.greenAccent,
            textColor: Colors.black,
          )
        ],
      ),
    );
  }
}
