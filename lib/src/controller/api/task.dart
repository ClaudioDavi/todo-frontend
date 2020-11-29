import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:todo_app/src/models/task.dart';

const String API_URL = 'http://127.0.0.1:8001/api/tasks/';

Future<http.Response> fetchTask(int taskId) async {
  return await http.get('$API_URL$taskId/');
}

Future<http.Response> fetchAllTasks() async {
  return await http.get(API_URL);
}

Future<http.Response> postTask(Task t) async {
  return await http.post(API_URL, body: jsonEncode(t), headers: {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  });
}

Future<http.Response> putTask(Task t) async {
  return await http.put('$API_URL${t.id}/', body: jsonEncode(t), headers: {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  });
}

