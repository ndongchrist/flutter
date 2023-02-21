import "package:bmi_calculator/constants.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import 'ReusableCard.dart';
import 'InputPage.dart';

class resultScreen extends StatelessWidget {
  const resultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Your Result",
                  style: KYourResultTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 185,
                      margin: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          color: kActivatorColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              "Normal",
                              style: kStateTextStyle,
                            ),
                          )),
                          Expanded(
                              child: Text(
                            "17.3",
                            style: kNumberTextStyle,
                          )),
                          Expanded(
                              child: Text(
                            "Your BMI is low, You should probably eat more",
                            textAlign: TextAlign.center,
                          ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: BottomButton(
              onTap: () {
                Navigator.pushNamed(context, "/");
              },
              text: "Re-Calculate",
            ))
          ],
        ));
  }
}
