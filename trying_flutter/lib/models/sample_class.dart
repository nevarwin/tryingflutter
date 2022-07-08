import 'package:flutter/material.dart';

class SampleClass {
  final String gName;
  final double gAmount;
  final double charge;
  final DateTime date;
  final Color color;

  SampleClass({
    required this.gName,
    required this.gAmount,
    required this.charge,
    DateTime? date,
    this.color = Colors.deepPurpleAccent,
  }) : date = date ?? DateTime.now();
}
