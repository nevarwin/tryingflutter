import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({
    Key? key,
    required this.addTx,
  }) : super(key: key);
  final Function addTx;

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
                  addTx(
                    titleController.text,
                    double.parse(amountController.text),
                  );
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
