import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/taskData.dart';

class Taskcheckbox extends StatefulWidget {
  @override
  State<Taskcheckbox> createState() => _TaskcheckboxState();
}

class _TaskcheckboxState extends State<Taskcheckbox> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    final Task = Provider.of<TaskData>(context);

    return Checkbox(
      value: isChecked,
      activeColor: Colors.lightBlueAccent,
      onChanged: (bool? newValue) {
        isChecked = newValue;
        Task.updateTask(newValue!);
      },

      // },
    );
  }
}
