import 'package:flutter/material.dart';

class SampleClass {
  final String title;
  final double unitPrice;
  final double newPrice;
  final DateTime date;
  final Color color;

  SampleClass({
    required this.title,
    required this.unitPrice,
    required this.newPrice,
    DateTime? date,
    this.color = Colors.deepPurpleAccent,
  }) : date = date ?? DateTime.now();
}
