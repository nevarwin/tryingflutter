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
    return Column(
      children: [
        Text(
          '$number',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 90,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(1),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
