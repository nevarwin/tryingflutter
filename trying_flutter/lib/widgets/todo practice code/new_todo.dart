import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({
    Key? key,
    required this.todoFunc,
  }) : super(key: key);

  final Function todoFunc;

  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final numController = TextEditingController();
  final dateController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    numController.dispose();
    dateController.dispose();
    super.dispose();
  }

  void _submit() {
    final tCrtl = titleController.text;
    final dCrtl = descController.text;
    final nCtrl = double.parse(numController.text);
    final dateCtrl = DateTime.parse(dateController.text);

    if (tCrtl.isEmpty && dCrtl.isEmpty && nCtrl == 0) {
      return;
    }

    widget.todoFunc(
      tCrtl,
      dCrtl,
      nCtrl,
      dateCtrl,
      Colors.blue,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            keyboardType: TextInputType.text,
            controller: titleController,
            onSubmitted: (_) => _submit(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Description'),
            keyboardType: TextInputType.text,
            controller: descController,
            onSubmitted: (_) => _submit(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Number'),
            keyboardType: TextInputType.number,
            controller: numController,
            onSubmitted: (_) => _submit(),
          ),
          TextField(
            readOnly: true,
            controller: dateController,
            decoration: InputDecoration(hintText: 'Date'),
            onSubmitted: (_) => _submit(),
            onTap: () async {
              var date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2022),
                lastDate: DateTime.now(),
              );
              dateController.text = date.toString().substring(0, 10);
            },
          ),
          RaisedButton(
            child: Text('Submit'),
            onPressed: () => _submit(),
            color: Colors.lightGreen,
            textColor: Colors.black,
          )
        ],
      ),
    );
  }
}
