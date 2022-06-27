import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

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

  void _submit() {
    final tCtrl = titleController.text;
    final aCtrl = double.parse(amountController.text);

    if (tCtrl.isEmpty && aCtrl <= 0) {
      return;
    }

    widget.addTx(
      tCtrl,
      aCtrl,
    );

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
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
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                keyboardType: TextInputType.text,
                onSubmitted: (_) => _submit(),
              ),
              TextField(
                controller: amountController,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                ),
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submit(),
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
