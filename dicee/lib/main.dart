import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 110, 21, 194),
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Color.fromARGB(255, 110, 21, 194),
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftbuttonnumber = 1;
  var rightButtonNumber = 1;

  void updateDice() {
    leftbuttonnumber = Random().nextInt(6) + 1;
    rightButtonNumber = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: TextButton(
            child: Image.asset('images/dice$leftbuttonnumber.png'),
            onPressed: () {
              setState(() {
                updateDice();
              });
            },
          )),
          Expanded(
            child: TextButton(
              child: Image.asset('images/dice$rightButtonNumber.png'),
              onPressed: () {
                setState(() {
                  updateDice();
                });
              },
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}
