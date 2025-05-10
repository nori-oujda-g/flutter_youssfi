import 'package:flutter/material.dart';

class Counterstate extends ChangeNotifier {
  int counter = 0;
  void increment() {
    ++counter;
    notifyListeners();
  }

  void deccrement() {
    --counter;
    notifyListeners();
  }
}
