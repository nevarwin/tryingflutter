import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/sample_class.dart';

class SampleWidget extends StatelessWidget {
  SampleWidget({Key? key}) : super(key: key);

  final List<SampleClass> samples = [
    SampleClass(
      title: 'First Title',
      subtitle: 'Nice Description',
      date: DateTime.now(),
      color: Colors.deepOrange,
    ),
    SampleClass(
      title: 'Second Title',
      subtitle: 'Great Description',
      date: DateTime.now(),
    ),
  ];

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
