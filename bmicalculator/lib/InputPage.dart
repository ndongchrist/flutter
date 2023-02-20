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
int weight = 60;
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
                              kHeight.toString(),
                              style: kTextStyle,
                            ),
                            Text(
                              "cm",
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Slider(
                            value: kHeight.toDouble(),
                            min: 120,
                            max: 220,
                            activeColor: Color(0xFFEB1555),
                            inactiveColor: Color(0xFF8D8ED9),
                            onChanged: (double newValue) {
                              setState(() {
                                kHeight = newValue.round();
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
                          weight.toString(),
                          style: kTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Color(0xFF1C1B2D),
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(
                              backgroundColor: Color(0xFF1C1B2D),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    )),
                ReusableCard(
                  colour: Color(0xFF1D1A2F),
                  cardChild: MyButton(icon: Icons.add),
                  // cardChild: Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       "Age",
                  //       style: kLabelTextStyle,
                  //     ),
                  //     Text(
                  //       age.toString(),
                  //       style: kTextStyle,
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         FloatingActionButton(
                  //           backgroundColor: Color(0xFF1C1B2D),
                  //           child: Icon(
                  //             Icons.remove,
                  //             color: Colors.white,
                  //           ),
                  //           onPressed: () {},
                  //         ),
                  //         SizedBox(
                  //           width: 20,
                  //         ),
                  //         FloatingActionButton(
                  //           backgroundColor: Color(0xFF1C1B2D),
                  //           child: Icon(
                  //             Icons.add,
                  //             color: Colors.white,
                  //           ),
                  //           onPressed: () {},
                  //         ),
                  //       ],
                  //     )
                  //   ],
                  // ),
                ),
              ],
            ),
            Container(
              color: Color(0xFFD8004C),
              height: 40,
              width: double.infinity,
              margin: EdgeInsets.only(top: 0),
              child: Center(
                  child: Text(
                "Calculate your BMI",
                style: TextStyle(fontWeight: FontWeight.w700),
              )),
            )
          ],
        ));
  }
}

class MyButton extends StatelessWidget {
  MyButton({this.icon});
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(height: 56, width: 56),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Icon(icon),
      fillColor: Color.fromARGB(255, 22, 12, 204),
    );
  }
}
