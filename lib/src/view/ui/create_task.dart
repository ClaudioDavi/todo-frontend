import 'package:flutter/material.dart';
import 'package:todo_app/src/controller/services/task.dart';
import 'package:todo_app/src/models/task.dart';

class CreateTaskForm extends StatefulWidget {
  @override
  CreateTaskFormState createState() {
    return CreateTaskFormState();
  }
}

class CreateTaskFormState extends State<CreateTaskForm> {
  final _formKey = GlobalKey<FormState>();
  var task = new Task(completed: false, date: new DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
              onChanged: (newValue) {
                setState(() {
                  task.title = newValue;
                });
              },
              decoration: InputDecoration(labelText: 'Task Title'),
              maxLength: 200),
          TextFormField(
              onChanged: (newValue) {
                setState(() {
                  task.description = newValue;
                });
              },
              decoration: InputDecoration(labelText: 'Task Description'),
              maxLength: 1500),
          Checkbox(
            value: task.completed,
            onChanged: (newValue) {
              setState(() {
                task.completed = newValue;
              });
            },
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await createTask(task);
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Saving Task')));
                Navigator.pop(context);
              } on Exception catch (e) {
                print(e);
              }

            },
            child: Text('Create'),
          )
        ],
      ),
    );
  }
}
