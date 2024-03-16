import 'package:flutter/material.dart';

class LoaderProvider with ChangeNotifier {
  bool _isApiCallProcess = false;
  bool get isApiCallProcess => _isApiCallProcess;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setApiLoadingStatus(bool status) {
    _isApiCallProcess = status;
    notifyListeners();
  }

  setIsLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }
}
