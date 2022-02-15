import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  bool darktheme = true;

  changetheme() {
    darktheme = !darktheme;
    notifyListeners();
  }
}
