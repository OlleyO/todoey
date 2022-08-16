import 'package:flutter/foundation.dart';

import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: "Todo 1"),
    Task(name: "Todo 2"),
    Task(name: "Todo 3"),
  ];

  bool _deleteWhenChecked = false;

  bool get deleteWhenChecked => _deleteWhenChecked;

  int get tasksCount => _tasks.length;

  List<Task> get tasks => _tasks;

  void toggleTaskByIndex(int index) {
    _tasks[index].isDone = !tasks[index].isDone;

    if (_deleteWhenChecked) {
      _tasks.removeAt(index);
    }

    notifyListeners();
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTaskByIndex(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void toggleDeleteWhenChecked() {
    _deleteWhenChecked = !_deleteWhenChecked;
    notifyListeners();
  }
}
