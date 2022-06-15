import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trying_flutter/widgets/sample%20practice%20code/new_samples.dart';
import 'package:trying_flutter/widgets/sample%20practice%20code/sample_list.dart';
import '../../models/sample_class.dart';

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
      children: [
        NewSamples(),
        const SizedBox(height: 10),
        SampleList(
          samples: samples,
        ),
      ],
    );
  }
}
