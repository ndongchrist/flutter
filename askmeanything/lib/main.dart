import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Answers(),
    );
  }
}

class Answers extends StatefulWidget {
  const Answers({super.key});

  @override
  State<Answers> createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
  @override
  // ignore: override_on_non_overriding_member
  var list = ['No', 'Yes', "I don't Know"];
  int random = 0;
  String answer = "";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ask Me Anything"),
      ),
      body: Center(
        child: Stack(
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    random = Random().nextInt(3);
                    answer = list[random];
                  });
                },
                child: Container(
                  height: 70,
                  width: 150,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      "$answer",
                      style:
                          TextStyle(color: Color.fromARGB(255, 248, 247, 247)),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
