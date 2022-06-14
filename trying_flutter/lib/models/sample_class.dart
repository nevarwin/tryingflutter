import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SampleClass {
  final String title;
  final String subtitle;
  final DateTime date;
  final Color color;

  SampleClass({
    required this.title,
    required this.subtitle,
    DateTime? date,
    this.color = Colors.deepPurpleAccent,
  }) : date = date ?? DateTime.now();
}
