import 'package:flutter/material.dart';
import 'package:todo_app/src/controller/api/task.dart';
import 'package:todo_app/src/models/task.dart';

typedef void TaskCallback(Task t);

class TodoListItem extends StatefulWidget {
  Task task;
  final TaskCallback taskCallback;

  TodoListItem({Key key, this.task, this.taskCallback}) : super(key: key);

  @override
  TodoListItemState createState() {
    return TodoListItemState();
  }
}

class TodoListItemState extends State<TodoListItem> {

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: ListTile(
        title: new Text(widget.task.title),
        subtitle: new Text(widget.task.date.toString().split(" ")[0]),
        trailing: new Checkbox(
          value: widget.task.completed,
          onChanged: (newValue) async {
            setState(() {
              widget.task.completed = newValue;
            });
            await putTask(widget.task);
          },
        ),
        onTap: () {
          widget.taskCallback(widget.task);
        },
      ),
    );
  }
}