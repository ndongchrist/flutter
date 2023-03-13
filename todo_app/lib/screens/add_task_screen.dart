import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/taskData.dart';
import '../widgets/taskData.dart';
import '../widgets/taskData.dart';

class AddTask extends StatelessWidget {
  String? newTask;
  Widget build(BuildContext context) {
    final Task = Provider.of<TaskData>(context);
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                newTask = value;
              },
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              color: Colors.lightBlueAccent,
              child: TextButton(
                onPressed: () {
                  Task.addTask(newTask!);
                  Navigator.pop(context);
                },
                child: Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
