import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/task.dart';
import 'package:todo_app/widgets/taskData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskData()),
      ],
      child: MaterialApp(
        home: SafeArea(child: TasksScreen()),
      ),
    );
  }
}
