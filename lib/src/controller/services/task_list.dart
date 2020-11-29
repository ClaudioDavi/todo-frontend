import 'package:todo_app/src/controller/api/task_list.dart';
import 'package:todo_app/src/models/task_list.dart';
import 'dart:async';
import 'dart:convert';


Future<TaskList> getTaskList(int taskListId) async {
  final response = await fetchTaskList(taskListId);

  if (response.statusCode == 200) {
    return TaskList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Task');
  }
}

Future<TaskList> getAllTaskLists() async {
  final response = await fetchAllTaskLists();
  if (response.statusCode == 200) {
    return TaskList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Task');
  }
}