import 'package:flutter/material.dart';

class SampleClass {
  final String gName;
  final double gAmount;
  final double charge;
  final DateTime date;

  SampleClass({
    required this.gName,
    required this.gAmount,
    required this.charge,
    DateTime? date,
  }) : date = date ?? DateTime.now();
}
