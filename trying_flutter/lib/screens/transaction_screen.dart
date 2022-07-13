import 'package:flutter/material.dart';

import '../widgets/transaction practice code/new_transaction.dart';
import '../widgets/transaction practice code/transactions_list.dart';
import '../widgets/transaction practice code/chart.dart';

import '../models/transaction.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final List<Transaction> _userTransactions = [
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
    DateTime date,
  ) {
    final newtx = Transaction(
      title: title,
      amount: amount,
      date: date,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newtx);
    });
  }

  List<Transaction> get _recentTransaction {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(
            days: 7,
          ),
        ),
      );
    }).toList();
  }

  void _showModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
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

  void _delete(String id) {
    setState(() {
      return _userTransactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Chart(recentTransaction: _recentTransaction),
          Expanded(
            child: TransactionsList(
              transaction: _userTransactions,
              delete: _delete,
            ),
          ),
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
