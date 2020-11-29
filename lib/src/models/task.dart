import 'dart:core';
import 'package:intl/intl.dart';

class Task {
  final int id;
  String title;
  String description;
  final DateTime date;
  bool completed;
  int taskList;

  Task(
      {this.id,
      this.title,
      this.description,
      this.date,
      this.completed,
      this.taskList});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      completed: json['completed'],
      taskList: json['task_list'],
    );
  }

  _dateFormatter<String>() {
    var formatter = new DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'date': _dateFormatter(),
        'completed': completed,
        'task_list': taskList,
      };
}
