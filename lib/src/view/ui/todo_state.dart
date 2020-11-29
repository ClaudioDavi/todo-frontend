import 'package:flutter/material.dart';
import 'package:todo_app/src/controller/services/task.dart';
import 'package:todo_app/src/models/task.dart';
import 'package:todo_app/src/view/widget/create_task.dart';
import 'package:todo_app/src/view/widget/text_section.dart';
import 'package:todo_app/src/view/widget/todo_item.dart';
import 'package:todo_app/src/view/widget/todo_list.dart';

class TodoState extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<TodoState> {
  Future<List<Task>> futureTasks;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    futureTasks = getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Todo App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          appBar: AppBar(
            title: Text('TODO App'),
          ),
          body: Center(
            child: FutureBuilder<List<Task>>(
              future: futureTasks,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return snapshot.hasError
                      ? Text("${snapshot.error}")
                      : Text("${snapshot.data}");
                }
                return TodoList(snapshot.data);
              },
            ),
          ),
          floatingActionButton: new FloatingActionButton(
            onPressed: _addTodoItemScreen,
            tooltip: 'Create TODO',
            child: new Icon(Icons.add)
          ),
        ));
  }

  _addTodoItemScreen() async {
    await Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            appBar: AppBar(
              title: new Text('Create Task'),
            ),
            body: new CreateTaskForm(),
          );
        }
      )
    );
    setState(() {
      futureTasks = getAllTasks();
    });
  }
}
