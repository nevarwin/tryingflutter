import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/sample_class.dart';

class SampleList extends StatelessWidget {
  const SampleList({
    Key? key,
    required this.samples,
  }) : super(key: key);

  final List<SampleClass> samples;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: samples.map(
        (smp) {
          return Card(
            child: Row(
              children: [
                CircleAvatar(backgroundColor: smp.color),
                Text(smp.title),
                Text(smp.subtitle),
                Text(
                  DateFormat('MMMM dd').format(smp.date),
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
