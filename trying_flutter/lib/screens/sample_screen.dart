import 'package:flutter/material.dart';

import '../models/sample_class.dart';
import '../widgets/sample practice code/new_samples.dart';
import '../widgets/sample practice code/sample_list.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({Key? key}) : super(key: key);

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  final List<SampleClass> samples = [
    SampleClass(
      title: 'Onigiri',
      unitPrice: 55.00,
      newPrice: 60.00,
      date: DateTime.now(),
      color: Colors.deepOrange,
    ),
    SampleClass(
      title: 'Fuwa fuwa bun',
      unitPrice: 42.00,
      newPrice: 50.00,
      date: DateTime.now(),
    ),
  ];

  void _addSamples(
    String title,
    double unitPrice,
    double newPrice,
    DateTime date,
  ) {
    final smpls = SampleClass(
      title: title,
      unitPrice: unitPrice,
      newPrice: newPrice,
      date: date,
    );

    setState(() {
      samples.add(smpls);
    });
  }

  void _showModal() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewSamples(
            sampleFunc: _addSamples,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SampleList(samples: samples),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () => _showModal(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
