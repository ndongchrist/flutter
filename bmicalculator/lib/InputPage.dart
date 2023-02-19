import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableCard.dart';
import 'icon_content.dart';

Color activateColor = Color(0xFF1D1A2F);
Color inactivateColor = Color(0xFF121124);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Gender gender = Gender.male;

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                        colour: gender == Gender.male
                            ? activateColor
                            : inactivateColor,
                        cardChild: IconWid(
                          icon: FontAwesomeIcons.mars,
                          text: "Male",
                        )),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      colour: gender == Gender.female
                          ? activateColor
                          : inactivateColor,
                      cardChild: IconWid(
                        icon: FontAwesomeIcons.venus,
                        text: "Female",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                ReusableCard(
                    colour: Color(0xFF1D1A2F), cardChild: Text("Hello")),
              ],
            ),
            Row(
              children: [
                ReusableCard(
                    colour: Color(0xFF1D1A2F), cardChild: Text("Hello")),
                ReusableCard(
                    colour: Color(0xFF1D1A2F), cardChild: Text("Hello")),
              ],
            ),
            Container(
              color: Color(0xFFD8004C),
              height: 40,
              width: double.infinity,
              margin: EdgeInsets.only(top: 0),
            )
          ],
        ));
  }
}
