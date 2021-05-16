import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier {
  int openedCardIndex;

  CardProvider() {
    openedCardIndex = -1;
  }

  void changeOpenCardIndex(int newIndex) {
    this.openedCardIndex = newIndex;

    notifyListeners();
  }
}
