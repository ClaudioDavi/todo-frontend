import 'package:flutter/material.dart';
import 'package:todo_app/src/models/task.dart';
import 'package:todo_app/src/view/widget/todo_item.dart';

Widget TodoList(List<Task> tasks) {
  return new ListView.builder(
    itemBuilder: (context, index) {
      if (index < tasks.length) {
        return TodoListItem(task: tasks[index]);
      }
    },
  );
}
