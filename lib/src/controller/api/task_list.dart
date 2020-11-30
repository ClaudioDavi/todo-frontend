import 'package:http/http.dart' as http;
import 'dart:async';

const API_URL = "http://127.0.0.1:8001/api/task-lists/";

Future<http.Response> fetchTaskList(int taskListId) async {
  return await http.get('$API_URL$taskListId/');
}

Future<http.Response> fetchAllTaskLists() async {
  return await http.get(API_URL);
}

Future<http.Response> fetchTaskByTaskListId(int taskListId) async {
  return await http.get('$API_URL$taskListId/tasks');
}
