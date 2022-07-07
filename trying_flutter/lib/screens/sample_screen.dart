import 'package:flutter/material.dart';

import '../models/sample_class.dart';
import '../widgets/sample practice code/new_samples.dart';
import '../widgets/sample practice code/sample_list.dart';
import '../widgets/sample practice code/samples_chart.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({Key? key}) : super(key: key);

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  final List<SampleClass> _samples = [
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
      _samples.add(smpls);
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

  List<SampleClass> get _recentSamples {
    return _samples.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          const Duration(
            days: 7,
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SamplesChart(recentSamples: _recentSamples),
          Expanded(child: SampleList(samples: _samples)),
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
