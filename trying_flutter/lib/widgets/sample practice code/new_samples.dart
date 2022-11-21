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
  final chargeController = TextEditingController();
  final gAmountController = TextEditingController();
  final gNameController = TextEditingController();

  DateTime? _choosenDate;

  @override
  void dispose() {
    gNameController.dispose();
    gAmountController.dispose();
    chargeController.dispose();
    super.dispose();
  }

  void _submit() {
    final gName = gNameController.text;
    final gAmountCtrl = double.parse(gAmountController.text);
    final gCharge = int.parse(chargeController.text);

    if (gName == '' && gAmountCtrl == 0 && gCharge == 0) {
      return;
    }

    _choosenDate ??= DateTime.now();

    widget.sampleFunc(
      gName,
      gAmountCtrl,
      gCharge,
      _choosenDate,
    );

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
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              autofocus: true,
              autocorrect: true,
              decoration: const InputDecoration(labelText: 'Gcash Name'),
              controller: gNameController,
              keyboardType: TextInputType.text,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Gcash Amount'),
              controller: gAmountController,
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Charge'),
              controller: chargeController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      _choosenDate == null
                          ? 'Date: ${DateFormat.yMEd().format(DateTime.now())}'
                          : 'Date: ${DateFormat.yMEd().format(_choosenDate!)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
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
