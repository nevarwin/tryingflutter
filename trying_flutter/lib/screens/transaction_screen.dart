import 'package:flutter/material.dart';

import '../widgets/new_transaction.dart';
import '../widgets/transactions_list.dart';
import '../models/transaction.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final List<Transaction> transaction = [
    // Transaction(
    //   id: 't1',
    //   title: 'Title1',
    //   amount: 12.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Title2',
    //   amount: 11.39,
    //   date: DateTime.now(),
    // ),
  ];

  void _addNewTransaction(
    String title,
    double amount,
  ) {
    final newtx = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      transaction.add(newtx);
    });
  }

  void _showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {},
          child: NewTransaction(
            addTx: _addNewTransaction,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TransactionsList(transaction: transaction),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () => _showModal(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
