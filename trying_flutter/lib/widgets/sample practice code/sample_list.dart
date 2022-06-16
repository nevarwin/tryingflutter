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
    return Expanded(
      child: ListView.builder(
        itemCount: samples.length,
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: [
                CircleAvatar(backgroundColor: samples[index].color),
                Text(samples[index].title),
                Text(samples[index].subtitle),
                Text(
                  DateFormat('MMMM dd').format(samples[index].date),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
