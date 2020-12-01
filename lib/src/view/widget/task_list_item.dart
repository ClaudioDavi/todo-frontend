import 'package:flutter/material.dart';
import 'package:todo_app/src/controller/services/task.dart';
import 'package:todo_app/src/models/task.dart';
import 'package:todo_app/src/models/task_list.dart';

typedef void IntCallback(int id);

class TaskListItem extends StatefulWidget {
  TaskList taskList;
  final IntCallback onItemSelected;

  TaskListItem({Key key, this.taskList, this.onItemSelected}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TaskListItemState();
  }
}

class TaskListItemState extends State<TaskListItem> {
  @override
  Widget build(BuildContext context) {
    return new Card(
        child: ListTile(
      title: new Text(widget.taskList.title),
      onTap: () {
        widget.onItemSelected(widget.taskList.id);
        Navigator.pop(context);
      },
    ));
  }
}
