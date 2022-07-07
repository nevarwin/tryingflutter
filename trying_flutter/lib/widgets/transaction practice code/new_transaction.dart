import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction({
    Key? key,
    required this.addTx,
  }) : super(key: key);
  final Function addTx;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submit() {
    final tCtrl = titleController.text;
    final aCtrl = double.parse(amountController.text);

    if (tCtrl.isEmpty && aCtrl <= 0) {
      return;
    }

    widget.addTx(
      tCtrl,
      aCtrl,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        // if the user did not pick a date
        if (pickedDate == null) {
          return;
        }
        // to rerun build
        setState(() {
          _selectedDate = pickedDate;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                keyboardType: TextInputType.text,
                // onSubmitted: (_) => _submit(),
              ),
              TextField(
                controller: amountController,
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                // onSubmitted: (_) => _submit(),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Chosen'
                            : 'Picked Date: ${DateFormat.yMEd().format(_selectedDate!)}',
                      ),
                    ),

                    // ios styled button
                    FlatButton(
                      color: Theme.of(context).primaryColor,
                      child: const Text('Choose Date'),
                      onPressed: _presentDatePicker,
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  _submit();
                },
                color: Colors.purple,
                textColor: Colors.white,
                child: const Text('Add Transaction'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
