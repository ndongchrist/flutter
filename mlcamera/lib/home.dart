import 'package:flutter/material.dart';
import 'package:mlcamera/camera.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ML Camera'),
        ),
        body: Center(
          child: Container(
              height: 500,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: CameraApp()),
        ),
      ),
    );
  }
}
