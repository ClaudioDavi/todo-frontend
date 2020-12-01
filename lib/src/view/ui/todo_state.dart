import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/src/controller/services/task.dart';
import 'package:todo_app/src/controller/services/task_list.dart';
import 'package:todo_app/src/models/task.dart';
import 'package:todo_app/src/models/task_list.dart';
import 'package:todo_app/src/view/widget/task_list.dart';
import 'package:todo_app/src/view/widget/todo_list.dart';
import 'package:todo_app/src/view/ui/create_task.dart';

class TodoState extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<TodoState> {
  Future<List<Task>> futureTasks;
  Future<List<TaskList>> futureTaskList;
  int taskListId;

  @override
  void initState() {
    super.initState();
    taskListId = 0;
    futureTasks = getTasksByTaskList(taskListId);
    futureTaskList = getAllTaskLists();
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
          drawer: _drawer(),
          body: Center(
            child: FutureBuilder<List<Task>>(
              future: futureTasks,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return snapshot.hasError
                      ? Text("${snapshot.error}")
                      : Text("${snapshot.data}");
                }
                return TodoList(snapshot.data, (Task task) {
                  _addTodoItemScreen(task);
                });
              },
            ),
          ),
          floatingActionButton: new FloatingActionButton(
              onPressed: () {
                _addTodoItemScreen(
                    new Task(completed: false, date: DateTime.now()));
              },
              tooltip: 'Create TODO',
              child: new Icon(Icons.add)),
        ));
  }

  _addTodoItemScreen(Task task) async {
    await Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
        appBar: AppBar(
          title: new Text(task.id != null? 'Edit Task' : 'Create Task'),
        ),
        body: new CreateTaskForm(task: task),
      );
    }));
    setState(() {
      futureTasks = getAllTasks();
    });
  }

  _updateTaskList(int id) {
    setState(() {
      futureTasks = getTasksByTaskList(id);
    });
  }

  _drawer() {
    return Drawer(
      child: Container(
        child: new SafeArea(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DrawerHeader(
                child: Text("TODO APP"),
                decoration: BoxDecoration(color: Colors.blue),
              ),
              FutureBuilder<List<TaskList>>(
                future: futureTaskList,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return snapshot.hasError
                        ? Text("${snapshot.error}")
                        : Text("${snapshot.data}");
                  }
                  return TaskListDrawer(snapshot.data, (id) {
                    _updateTaskList(id);
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
