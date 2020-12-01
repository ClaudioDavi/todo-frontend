import 'package:flutter/material.dart';
import 'package:todo_app/src/controller/services/task.dart';
import 'package:todo_app/src/models/task.dart';

class CreateTaskForm extends StatefulWidget {
  Task task;
  CreateTaskForm({Key key, this.task}) : super(key: key);

  @override
  CreateTaskFormState createState() {
    return CreateTaskFormState();
  }
}

class CreateTaskFormState extends State<CreateTaskForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
              initialValue: widget.task.title,
              onChanged: (newValue) {
                setState(() {
                  widget.task.title = newValue;
                });
              },
              decoration: InputDecoration(labelText: 'Task Title'),
              maxLength: 200),
          TextFormField(
              initialValue: widget.task.description,
              onChanged: (newValue) {
                setState(() {
                  widget.task.description = newValue;
                });
              },
              decoration: InputDecoration(labelText: 'Task Description'),
              maxLength: 1500),
          Checkbox(
            value: widget.task.completed,
            onChanged: (newValue) {
              setState(() {
                widget.task.completed = newValue;
              });
            },
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                widget.task.id != null
                    ? await updateTask(widget.task)
                    : await createTask(widget.task);

                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Saving Task')));
                Navigator.pop(context);
              } on Exception catch (e) {
                print(e);
              }
            },
            child: Text('SAVE'),
          )
        ],
      ),
    );
  }
}
