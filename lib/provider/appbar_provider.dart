import 'package:flutter/material.dart';

class AppBarProvider with ChangeNotifier {
  bool _isAppbar = false;

  bool get isAppbar => _isAppbar;

  setValue(bool val) {
    _isAppbar = val;
    notifyListeners();
  }
}
