import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  color: Colors.blue,
                  child: TextButton(
                    onPressed: () {
                      final player = AudioPlayer();
                      player.play("note1.wav");
                    },
                    child: Text(""),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.red,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(""),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.yellow,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(""),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.orange,
                  child: TextButton(
                    onPressed: () {
                      final player = AudioCache();
                      player.play("note4.wav");
                    },
                    child: Text(""),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.yellowAccent,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(""),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blueGrey,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(""),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.green,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(""),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
