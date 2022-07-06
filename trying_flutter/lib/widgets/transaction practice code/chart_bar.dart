import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    Key? key,
    required this.label,
    required this.spendingAmount,
    required this.percentage,
  }) : super(key: key);

  final String label;
  final double percentage;
  final double spendingAmount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: Text(
                'Php$spendingAmount',
                style: const TextStyle(
                  fontSize: 11,
                ),
              ),
            ),
          ),
          Container(
            height: 90,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple, width: 1.0),
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(152, 29, 151, .4),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      border: Border.all(color: Colors.deepPurple, width: 1.0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(label),
          ),
        ],
      ),
    );
  }
}
