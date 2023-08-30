import 'package:flutter/material.dart';

class TaskList {
  final String _id = UniqueKey().toString();
  String title = "";
  DateTime date = DateTime.now();
  bool isDone = false;
  bool isFavorite = false;

  TaskList(this.title, this.date, this.isDone, this.isFavorite);

  String get id => _id;
}
