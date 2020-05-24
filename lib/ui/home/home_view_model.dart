import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void incrementCounter() {
    this._counter++;
    notifyListeners();
  }
}
