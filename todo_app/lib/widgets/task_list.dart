import 'package:flutter/material.dart';
import 'package:todo_app/widgets/tasktile.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Tasktile(),
      Tasktile(),
      Tasktile(),
    ]);
  }
}
