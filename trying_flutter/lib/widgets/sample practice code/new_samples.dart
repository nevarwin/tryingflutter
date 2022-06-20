import 'package:flutter/material.dart';

class NewSamples extends StatefulWidget {
  const NewSamples({
    Key? key,
    required this.sampleFunc,
  }) : super(key: key);

  final Function sampleFunc;

  @override
  State<NewSamples> createState() => _NewSamplesState();
}

class _NewSamplesState extends State<NewSamples> {
  final titleController = TextEditingController();
  final subController = TextEditingController();
  final dateController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    subController.dispose();
    dateController.dispose();
    super.dispose();
  }

  void _submit() {
    final tCtrl = titleController.text;
    final subCtrl = subController.text;
    final dateCtrl = DateTime.parse(dateController.text);

    if (tCtrl.isEmpty && subCtrl.isEmpty && dateCtrl == null) {
      return;
    }

    widget.sampleFunc(
      tCtrl,
      subCtrl,
      dateCtrl,
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
            onSubmitted: (_) => _submit(),
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
            keyboardType: TextInputType.text,
          ),
          TextField(
            onSubmitted: (_) => _submit(),
            decoration: InputDecoration(labelText: 'Subtitle'),
            controller: subController,
            keyboardType: TextInputType.text,
          ),
          TextField(
            onSubmitted: (_) => _submit(),
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
            onPressed: () => _submit(),
            color: Colors.blue[400],
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
