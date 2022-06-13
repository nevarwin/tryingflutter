import 'package:flutter/material.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  UserTransaction({Key? key}) : super(key: key);
  final List<Transaction> transaction = [
    Transaction(
      id: 't1',
      title: 'Title1',
      amount: 12.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Title2',
      amount: 11.39,
      date: DateTime.now(),
    ),
  ];

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
