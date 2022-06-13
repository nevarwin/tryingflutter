import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime todaysDate = DateTime.now();

class SampleClass {
  final String title;
  final String subtitle;
  DateTime date;
  final Color color;

  SampleClass({
    required this.title,
    required this.subtitle,
    required this.date,
    this.color = Colors.deepPurpleAccent,
  });
}
