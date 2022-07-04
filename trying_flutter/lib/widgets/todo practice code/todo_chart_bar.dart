import 'package:flutter/material.dart';

class TodoChartBar extends StatelessWidget {
  const TodoChartBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
