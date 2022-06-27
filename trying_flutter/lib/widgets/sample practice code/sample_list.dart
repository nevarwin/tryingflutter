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
    return Container(
      child: samples.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Nothing',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            )
          : Expanded(
              child: ListView.builder(
                itemCount: samples.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(
                      children: [
                        CircleAvatar(backgroundColor: samples[index].color),
                        Text(
                          samples[index].title,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(samples[index].subtitle),
                        Text(
                          DateFormat('MMMM dd').format(samples[index].date),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
