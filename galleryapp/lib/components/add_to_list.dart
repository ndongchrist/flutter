import 'package:flutter/material.dart';

class CardList extends ChangeNotifier {
  List cardList = [];

  void addToList(item) {
    cardList.add(item);
    notifyListeners();
  }
}
