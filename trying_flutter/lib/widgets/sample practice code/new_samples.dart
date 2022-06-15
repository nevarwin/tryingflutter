import 'package:flutter/material.dart';

class NewSamples extends StatelessWidget {
  const NewSamples({
    Key? key,
    required this.sampleFunc,
  }) : super(key: key);

  final Function sampleFunc;

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final subController = TextEditingController();
    final dateController = TextEditingController();

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
            decoration: InputDecoration(labelText: 'Subtitle'),
            controller: subController,
            keyboardType: TextInputType.text,
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
          RaisedButton(
            child: Text('Submit'),
            onPressed: () {
              sampleFunc(
                titleController.text,
                subController.text,
                DateTime.parse(dateController.text),
              );
            },
            color: Colors.blue[400],
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
