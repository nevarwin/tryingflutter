import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/transaction.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({
    Key? key,
    required this.transaction,
    required this.delete,
  }) : super(key: key);

  final List<Transaction> transaction;
  final Function delete;

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Nothing',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          )
        : ListView.builder(
            itemCount: transaction.length,
            itemBuilder: ((context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColorDark,
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        child: Text(
                          '\$${transaction[index].amount.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transaction[index].title,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              DateFormat('MMMM dd EEEE')
                                  .format(transaction[index].date),
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          delete(transaction[index].id);
                        },
                      )
                    ],
                  ),
                ),
              );
            }),
          );
  }
}
