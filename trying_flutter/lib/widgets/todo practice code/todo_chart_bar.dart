import 'package:flutter/material.dart';

class TodoChartBar extends StatelessWidget {
  const TodoChartBar({
    Key? key,
    required this.label,
    required this.number,
    required this.percentage,
  }) : super(key: key);

  final String label;
  final double number;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        verticalDirection: VerticalDirection.up,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: Text(
                '$number',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: 90,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 74, 126, 101),
                    border: Border.all(
                      color: Color.fromARGB(136, 12, 50, 8),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 120, 220, 172),
                      border: Border.all(
                        color: Color.fromARGB(136, 12, 50, 8),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
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
