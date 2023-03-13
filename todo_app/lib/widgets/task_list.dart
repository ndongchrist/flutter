import 'package:flutter/material.dart';
import 'package:todo_app/widgets/tasktile.dart';
import 'package:provider/provider.dart';

import 'taskData.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Task = Provider.of<TaskData>(context);
    return ListView.builder(
        itemCount: Task.taskCount,
        itemBuilder: (context, index) {
          return Tasktile(
            title: Task.tasks[index],
          );
        });
  }
}
