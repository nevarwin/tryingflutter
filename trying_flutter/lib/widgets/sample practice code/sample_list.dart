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
    return samples.isEmpty
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
        : ListView.builder(
            itemCount: samples.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  tileColor: Colors.white70,
                  style: ListTileStyle.list,
                  title: Text(
                    samples[index].gName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 3.0,
                        ),
                        child: Text(
                          samples[index].gAmount.toStringAsFixed(2),
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 3.0,
                        ),
                        child: Text(
                          samples[index].charge.toStringAsFixed(2),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        DateFormat.yMMMMEEEEd().format(DateTime.now()),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                  leading: CircleAvatar(
                    backgroundColor: samples[index].color,
                  ),
                ),
              );
            },
          );
  }
}
