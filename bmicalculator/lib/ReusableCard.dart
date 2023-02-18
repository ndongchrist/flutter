import 'package:flutter/material.dart';

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
