import 'package:todo_app/src/controller/api/task.dart';
import 'package:todo_app/src/controller/api/task_list.dart';
import 'package:todo_app/src/models/task.dart';
import 'dart:async';
import 'dart:convert';

Future<Task> getTask(int taskId) async {
  final response = await fetchTask(taskId);

  if (response.statusCode == 200) {
    return Task.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Task $response');
  }
}

Future<List<Task>> getAllTasks() async {
  final response = await fetchAllTasks();
  if (response.statusCode == 200) {
    var tasks = json.decode(response.body);
    var taskList = new List<Task>();

    for (var task in tasks) {
      taskList.add(Task.fromJson(task));
    }
    return taskList;
  } else {
    throw Exception('Failed to load Task');
  }
}

Future<List<Task>> getTasksByTaskList(int taskListId) async {
  final response = await fetchTaskByTaskListId(taskListId);
  if (response.statusCode == 200) {
    var tasks = json.decode(response.body);
    var taskList = new List<Task>();

    for (var task in tasks) {
      taskList.add(Task.fromJson(task));
    }
    return taskList;
  } else {
    throw Exception('Failed to load tasks');
  }
}

Future<Task> createTask(Task t) async {
  final response = await postTask(t);
  if (response.statusCode == 200) {
    print("Criei a Task");
    return Task.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to Create Task');
  }
}

Future<Task> updateTask(Task t) async {
  final response = await putTask(t);
  if (response.statusCode == 200) {
    print("Task Updated");
    return Task.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to update Task');
  }
}
