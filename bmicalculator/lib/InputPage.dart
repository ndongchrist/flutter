import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

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
                ReusableCard(
                    colour: Color(0xFF1D1A2F),
                    cardChild: IconWid(
                      icon: FontAwesomeIcons.mars,
                      text: "Male",
                    )),
                ReusableCard(
                  colour: Color(0xFF1D1A2F),
                  cardChild: IconWid(
                    icon: FontAwesomeIcons.venus,
                    text: "Female",
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

class IconWid extends StatelessWidget {
  IconWid({required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(text),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, required this.cardChild});
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: cardChild,
        height: 185,
        margin: EdgeInsets.all(7.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
