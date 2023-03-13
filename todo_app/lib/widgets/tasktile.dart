import 'package:flutter/material.dart';
import 'package:todo_app/widgets/taskCheckbox.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/taskData.dart';

class Tasktile extends StatelessWidget {
  Tasktile({required this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    final Task = Provider.of<TaskData>(context);
    return ListTile(
      onLongPress: () {
        Task.deleteTask(title!);
      },
      trailing: Taskcheckbox(),
      title: Text(
        ' $title',
        style: TextStyle(
            decoration:
                Task.checkedBoxValue! ? TextDecoration.lineThrough : null),
      ),
    );
  }
}
