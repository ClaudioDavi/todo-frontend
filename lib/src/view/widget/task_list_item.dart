import 'package:flutter/material.dart';
import 'package:todo_app/src/models/task_list.dart';

class TaskListItem extends StatefulWidget {
  TaskList taskList;

  TaskListItem({Key key, this.taskList}) : super(key: key);

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
      onTap: () async {
        setState(() {});
      },
    ));
  }
}
