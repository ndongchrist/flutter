import 'dart:collection';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class TaskData extends ChangeNotifier {
  final List<String> _tasks = [
    'Buy Milk',
    'Buy Eggs',
    'Buy Bread',
    'Buy Butter'
  ];

  int get taskCount {
    return tasks.length;
  }

  UnmodifiableListView<String> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void deleteTask(String taskTitle) {
    _tasks.remove(taskTitle);
    notifyListeners();
  }

  bool? checkedBoxValue = false;

  void updateTask(bool newValue) {
    if (newValue == true) {
      newValue = false;
    } else {
      newValue = true;
    }
    notifyListeners();
  }

  void addTask(String newTaskTitle) {
    _tasks.add(newTaskTitle);
    notifyListeners();
  }
}
