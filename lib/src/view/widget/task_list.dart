import 'package:flutter/material.dart';
import 'package:todo_app/src/models/task_list.dart';
import 'package:todo_app/src/view/widget/task_list_item.dart';

Widget TaskListDrawer(List<TaskList> tasklists) {
  TaskList all = new TaskList(id: 0, title: "All Tasks");
  tasklists.insert(0, all);
  return new ListView.builder(
    shrinkWrap: true,
    itemBuilder: (context, index) {
      if (index < tasklists.length) {
        return TaskListItem(taskList: tasklists[index]);
      }
    },
  );
}