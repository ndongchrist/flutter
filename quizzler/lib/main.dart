import 'dart:math';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Quizzler(),
      ),
    ),
  );
}

class Quizzler extends StatefulWidget {
  const Quizzler({super.key});

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  QuizBrain quizBrain = QuizBrain();

  List<Widget> scoreKeeper = [];

  void checkAnswer(bool userAnswer) {
    var correctAnswer = quizBrain.getAnswer();

    if (userAnswer == correctAnswer) {
      setState(() {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));

        quizBrain.nextQuestion();
      });
    } else {
      setState(() {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
        quizBrain.nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizBrain.getQuestion(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () {
              checkAnswer(true);
              if (quizBrain.isFinished()) {
                _onAlertButtonsPressed(context);
              }
            },
            child: Container(
              margin: const EdgeInsets.all(10.0),
              width: max(200, 566),
              child: Center(child: Text("True")),
              color: Colors.green,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () {
              checkAnswer(false);
              if (quizBrain.isFinished()) {
                _onAlertButtonsPressed(context);
                scoreKeeper.clear();
              }

              // _onAlertButtonsPressed(context);
            },
            child: Container(
              margin: const EdgeInsets.all(10.0),
              width: max(200, 566),
              child: Center(child: Text("False")),
              color: Colors.red,
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: scoreKeeper,
          ),
        )
      ],
    );
  }
}

_onAlertButtonsPressed(context) {
  Alert(
    context: context,
    type: AlertType.warning,
    title: "Game Over",
    desc: "Game Just Ended",
    buttons: [
      // DialogButton(
      //   child: Text(
      //     "FLAT",
      //     style: TextStyle(color: Colors.white, fontSize: 18),
      //   ),
      //   onPressed: () {
      //     Navigator.pop(context);

      //   },
      //   color: Color.fromRGBO(0, 179, 134, 1.0),
      // ),
      DialogButton(
        child: Text(
          "RESET",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        gradient: LinearGradient(colors: [
          Color.fromRGBO(116, 116, 191, 1.0),
          Color.fromRGBO(52, 138, 199, 1.0),
        ]),
      )
    ],
  ).show();
}
