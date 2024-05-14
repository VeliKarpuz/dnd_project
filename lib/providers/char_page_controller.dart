import 'package:flutter/material.dart';

class CharPageController extends ChangeNotifier {
  int charPageNumber = 1;

  void setCharPageNumber(int number) {
    charPageNumber = number;
    notifyListeners();
  }
}
