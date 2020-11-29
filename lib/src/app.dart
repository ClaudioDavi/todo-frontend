import 'package:flutter/material.dart';
import 'package:todo_app/src/view/ui/todo_state.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoState(),
    );
  }
}