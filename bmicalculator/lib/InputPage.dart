import 'package:bmi_calculator/calculatorBrain.dart';
import 'package:bmi_calculator/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableCard.dart';
import 'icon_content.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Gender? gender;
double weight = 60;
int age = 19;

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
                          ? kActivatorColor
                          : kInactivateColor,
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
                        ? kActivatorColor
                        : kInactivateColor,
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
                  colour: Color(0xFF1D1A2F),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Height",
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            kHeight.round().toString(),
                            style: kTextStyle,
                          ),
                          Text(
                            "cm",
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                      Slider(
                          value: kHeight,
                          min: 120,
                          max: 220,
                          activeColor: Color(0xFFEB1555),
                          inactiveColor: Color(0xFF8D8ED9),
                          onChanged: (double newValue) {
                            setState(() {
                              kHeight = newValue;
                            });
                          })
                    ],
                  )),
            ],
          ),
          Row(
            children: [
              ReusableCard(
                  colour: Color(0xFF1D1A2F),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Weight",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.round().toString(),
                        style: kTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyButton(
                            icon: Icons.remove,
                            onPressed: () {
                              setState(() {
                                weight = weight - 1;
                              });
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          MyButton(
                            icon: Icons.add,
                            onPressed: () {
                              setState(() {
                                weight = weight + 1;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  )),
              ReusableCard(
                colour: Color(0xFF1D1A2F),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Age",
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyButton(
                          icon: Icons.remove,
                          onPressed: () {
                            setState(() {
                              age = age - 1;
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        MyButton(
                          icon: Icons.add,
                          onPressed: () {
                            setState(() {
                              age = age + 1;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          BottomButton(
            text: "Calculate",
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: kHeight, weight: weight);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => resultScreen(
                      bmiResult: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                      resultText: calc.calculateBMI()),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.text});

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Color(0xFFD8004C),
        height: 40,
        width: double.infinity,
        margin: EdgeInsets.only(top: 0),
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w700),
        )),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  MyButton({this.icon, required this.onPressed});
  final IconData? icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      child: Icon(icon),
      fillColor: Color(0xFF1C1B2D),
      elevation: 10.0,
      constraints: BoxConstraints.tightFor(height: 56, width: 56),
    );
  }
}
