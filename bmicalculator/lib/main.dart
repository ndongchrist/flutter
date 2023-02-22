import 'package:bmi_calculator/result_screen.dart';
import 'package:flutter/material.dart';
import 'InputPage.dart';
import 'constants.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF0D0F1E),
          primaryColor: Colors.black),
      home: InputPage(),
    );
  }
}
