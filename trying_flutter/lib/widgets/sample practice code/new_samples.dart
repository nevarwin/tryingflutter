import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final gName = TextEditingController();
  final gAmount = TextEditingController();
  final charge = TextEditingController();
  DateTime? _choosenDate;

  @override
  void dispose() {
    gName.dispose();
    gAmount.dispose();
    charge.dispose();
    super.dispose();
  }

  void _submit() {
    final tCtrl = gName.text;
    final uPriceCtrl = double.parse(gAmount.text);
    final newPriceCtrl = double.parse(gAmount.text);

    if (tCtrl.isEmpty && uPriceCtrl == 0 && newPriceCtrl == 0) {
      return;
    }

    widget.sampleFunc(tCtrl, uPriceCtrl, newPriceCtrl, _choosenDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          _choosenDate = pickedDate;
          _submit();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              autofocus: true,
              autocorrect: true,
              decoration: const InputDecoration(labelText: 'Gcash Name'),
              controller: gName,
              keyboardType: TextInputType.text,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Gcash Amount'),
              controller: gAmount,
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Charge'),
              controller: charge,
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _choosenDate == null
                        ? 'No date choosen'
                        : 'Date: ${DateFormat.yMEd().format(_choosenDate!)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  FlatButton(
                    child: const Text('Select date'),
                    color: Colors.blue,
                    onPressed: _presentDatePicker,
                  )
                ],
              ),
            ),
            RaisedButton(
              child: const Text('Submit'),
              onPressed: () => _submit(),
              color: Colors.blue[400],
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
