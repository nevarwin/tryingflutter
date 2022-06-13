import 'package:flutter/material.dart';

class TodoClass {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final Color color;

  TodoClass({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.color,
  });
}
