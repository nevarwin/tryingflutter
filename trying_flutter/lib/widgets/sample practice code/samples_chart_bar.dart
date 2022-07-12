import 'package:flutter/material.dart';

class SamplesChartBar extends StatelessWidget {
  const SamplesChartBar({
    Key? key,
    required this.label,
    required this.amount,
    required this.percentage,
  }) : super(key: key);

  final int amount;
  final String label;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 20,
            child: FittedBox(
              child: Text(
                '$amount',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
            width: 30,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 15, 115, 197),
                      width: 1.5,
                    ),
                    color: Color.fromARGB(255, 132, 166, 224),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percentage,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 15, 115, 197),
                        width: 1.5,
                      ),
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(3),
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
