import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode theme = ThemeMode.system;

  bool get isDarkMode => theme == ThemeMode.dark;

  setTheme(bool isON) {
    theme = isON ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
