import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../transaction practice code/chart_bar.dart';
import '../../models/transaction.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
    required this.recentTransaction,
  }) : super(key: key);

  final List<Transaction> recentTransaction;

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      var totalSum = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum += recentTransaction[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get _totalSpending {
    return groupedTransactionValues.fold(
      0.0,
      (previousValue, element) {
        return previousValue + (element['amount'] as double);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: groupedTransactionValues.map((data) {
            return ChartBar(
              label: data['day'].toString(),
              spendingAmount: data['amount'] as double,
              percentage: _totalSpending == 0.0
                  ? 0.0
                  : (data['amount'] as double) / _totalSpending,
            );
          }).toList(),
        ),
      ),
    );
  }
}
