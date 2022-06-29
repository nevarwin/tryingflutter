import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1),
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
