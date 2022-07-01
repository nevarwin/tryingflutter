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
  final unitPriceController = TextEditingController();
  final newPriceController = TextEditingController();
  final dateController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    unitPriceController.dispose();
    newPriceController.dispose();
    dateController.dispose();
    super.dispose();
  }

  void _submit() {
    final tCtrl = titleController.text;
    final uPriceCtrl = double.parse(unitPriceController.text);
    final newPriceCtrl = double.parse(unitPriceController.text);
    final dateCtrl = DateTime.parse(dateController.text);

    if (tCtrl.isEmpty &&
        uPriceCtrl == 0 &&
        newPriceCtrl == 0 &&
        dateCtrl == null) {
      return;
    }

    widget.sampleFunc(
      tCtrl,
      uPriceCtrl,
      newPriceCtrl,
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
            decoration: InputDecoration(labelText: 'Unit Price'),
            controller: unitPriceController,
            keyboardType: TextInputType.number,
          ),
          TextField(
            onSubmitted: (_) => _submit(),
            decoration: InputDecoration(labelText: 'New Price'),
            controller: newPriceController,
            keyboardType: TextInputType.number,
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
