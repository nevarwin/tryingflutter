import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/sample_class.dart';

class SampleList extends StatelessWidget {
  const SampleList({
    Key? key,
    required this.samples,
    required this.delete,
  }) : super(key: key);

  final List<SampleClass> samples;
  final Function delete;

  @override
  Widget build(BuildContext context) {
    return samples.isEmpty
        ? Column(
            children: [
              Expanded(
                child: SizedBox(
                  height: 300,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
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
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 8,
                ),
                child: ListTile(
                  tileColor: Colors.white70,
                  style: ListTileStyle.list,
                  leading: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        child: FittedBox(
                          child: Text(
                            '${samples[index].charge}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
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
                          'Gcash Amount: ${samples[index].gAmount.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        DateFormat('hh:mm EEEE-MMMM').format(DateTime.now()),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                    ),
                    onPressed: () {
                      delete(
                        samples[index].id,
                      );
                    },
                  ),
                ),
              );
            },
          );
  }
}
