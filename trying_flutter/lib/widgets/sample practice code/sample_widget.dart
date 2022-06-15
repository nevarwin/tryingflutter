import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trying_flutter/widgets/sample%20practice%20code/new_samples.dart';
import 'package:trying_flutter/widgets/sample%20practice%20code/sample_list.dart';
import '../../models/sample_class.dart';

class SampleWidget extends StatefulWidget {
  SampleWidget({Key? key}) : super(key: key);

  @override
  State<SampleWidget> createState() => _SampleWidgetState();
}

class _SampleWidgetState extends State<SampleWidget> {
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

  void _addSamples(
    String title,
    String subtitle,
    DateTime date,
  ) {
    final smpls = SampleClass(
      title: title,
      subtitle: subtitle,
      date: date,
    );

    setState(() {
      samples.add(smpls);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewSamples(sampleFunc: _addSamples),
        const SizedBox(height: 10),
        SampleList(
          samples: samples,
        ),
      ],
    );
  }
}
