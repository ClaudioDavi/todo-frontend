import 'package:http/http.dart' as http;
import 'dart:async';

Future<http.Response> fetchTaskList(int taskListId) async {
  return await http.get('http://127.0.0.1:8001/api/task_lists/$taskListId/');
}

Future<http.Response> fetchAllTaskLists() async {
  return await http.get('http://127.0.0.1:8001/api/task_lists/');
}