import 'package:flutter/material.dart';

class Tasktile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Checkbox(
        value: false,
        onChanged: (value) {},
      ),
      title: Text("Buy Milk"),
    );
  }
}
