import 'package:flutter/material.dart';

/// It is bad practice to use a global variable to store the state of the app.
/// But for the sake of simplicity, we will use a global variable.
/// This implementation would also rebuild multiple times unnecessarily and
/// splitting the state into multiple notifiers would be a better approach.
final notifier = CountersNotifier();

class CountersNotifier with ChangeNotifier {
  int _selectedNavigationIndex = 0;
  int get selectedNavigationIndex => _selectedNavigationIndex;

  void selectDestination(int index) {
    _selectedNavigationIndex = index;
    notifyListeners();
  }
}
