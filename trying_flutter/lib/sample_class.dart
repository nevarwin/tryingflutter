import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SampleClass {
  final String title;
  final String subtitle;
  DateTime date;
  final Color color;

  SampleClass({
    required this.title,
    required this.subtitle,
    this.date = DateTime.now(),
    this.color = Colors.deepPurpleAccent,
  });
}
