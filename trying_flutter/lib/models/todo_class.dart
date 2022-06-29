import 'package:flutter/material.dart';

class TodoClass {
  final String id;
  final String title;
  final String description;
  final double number;
  final DateTime date;
  final Color color;

  TodoClass({
    required this.id,
    required this.title,
    required this.description,
    required this.number,
    required this.date,
    this.color = Colors.blue,
  });
}
