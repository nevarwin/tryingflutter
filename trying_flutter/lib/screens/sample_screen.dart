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
    // SampleClass(
    //   gName: 'Onigiri',
    //   gAmount: 55.00,
    //   charge: 60.00,
    //   date: DateTime.now(),
    //   color: Colors.deepOrange,
    // ),
    // SampleClass(
    //   gName: 'Fuwa fuwa bun',
    //   gAmount: 42.00,
    //   charge: 50.00,
    //   date: DateTime.now(),
    // ),
  ];

  void _addSamples(
    String gCashName,
    double gCashAmount,
    double gCashCharge,
    DateTime date,
  ) {
    final smpls = SampleClass(
      gName: gCashName,
      gAmount: gCashAmount,
      charge: gCashCharge,
      date: date,
    );

    setState(() {
      _samples.add(smpls);
    });
  }

  void _showModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      barrierColor: Color.fromARGB(125, 245, 182, 65),
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
        mainAxisSize: MainAxisSize.min,
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
