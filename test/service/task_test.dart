import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/src/controller/services/task.dart';
import 'package:todo_app/src/models/task.dart';

void main() {
  group('Task Api Tests', () {
    test('Should return one task', () async {
      final task = await getTask(1);
      expect(task.completed, false);
    });
  });
}
