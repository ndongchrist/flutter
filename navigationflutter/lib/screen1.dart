import 'package:flutter/material.dart';
import 'package:navigationflutter/screen2.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Screen 1'),
      ),
      body: Center(
        child: TextButton(
          child: Text('Go Forwards To Screen 2'),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Screen2(),
            ));
          },
        ),
      ),
    );
  }
}
