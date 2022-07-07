import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/sample_class.dart';
import '../sample practice code/samples_chart_bar.dart';

class SamplesChart extends StatelessWidget {
  SamplesChart({
    Key? key,
    required this.recentSamples,
  }) : super(key: key);

  List<SampleClass> recentSamples;

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(
          days: index,
        ),
      );

      var totalProfit = 0.0;
      for (var i = 0; i < recentSamples.length; i++) {
        if (recentSamples[index].date.day == weekDay.day &&
            recentSamples[index].date.month == weekDay.month &&
            recentSamples[index].date.year == weekDay.year) {
          totalProfit += recentSamples[index].newPrice;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay),
        'profit': totalProfit,
      };
    });
  }

  double get _sumProfit {
    return groupedTransaction.fold(0.0, (previousValue, element) {
      return previousValue + (element['profit'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransaction.map((sData) {
          return SamplesChartBar(
            label: sData['day'].toString(),
            amount: sData['profit'] as double,
            percentage: _sumProfit == 0.0
                ? 0.0
                : (sData['profit'] as double) / _sumProfit,
          );
        }).toList(),
      ),
    );
  }
}
