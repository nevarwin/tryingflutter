import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
              ),
              TextField(
                controller: amountController,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                ),
                keyboardType: TextInputType.number,
              ),
              FlatButton(
                onPressed: () {
                  // Transaction(
                  //   id: DateTime.now().toString(),
                  //   title: titleController.text,
                  //   amount: double.parse(amountController.text),
                  //   date: DateTime.now(),
                  // );
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
