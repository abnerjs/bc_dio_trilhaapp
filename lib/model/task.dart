import 'package:flutter/material.dart';

class Task {
  final String _id = UniqueKey().toString();
  String description = "";
  bool isDone = false;

  Task(this.description, this.isDone);

  String get id => _id;
}
