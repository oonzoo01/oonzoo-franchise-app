import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuthProvider extends ChangeNotifier {
  File? _passportfrontimage;
  File? get passportfrontimage => _passportfrontimage;

  File? _passportbackimage;
  File? get passportbackimage => _passportbackimage;

  File? _frontlicenseimage;
  File? get frontlicenseimage => _frontlicenseimage;

  File? _backlicenseimage;
  File? get backlicenseimage => _backlicenseimage;

  File? _deliverymanimage;
  File? get deliverymanimage => _deliverymanimage;

  Future<void> pickpassportfrontImage(ImageSource source) async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      _passportfrontimage = File(pickedFile.path);

      notifyListeners();
    }
  }

  void removepassportfrontImage() {
    _passportfrontimage = null;
    notifyListeners();
  }

  Future<void> pickpassportbackImage(ImageSource source) async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      _passportbackimage = File(pickedFile.path);

      notifyListeners();
    }
  }

  void removepassportbackImage() {
    _passportbackimage = null;
    notifyListeners();
  }

  Future<void> pickfrontImage(ImageSource source) async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      _frontlicenseimage = File(pickedFile.path);
      notifyListeners();
    }
  }

  void removelicensefrontimage() {
    _frontlicenseimage = null;
    notifyListeners();
  }

  Future<void> pickbackImage(ImageSource source) async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      _backlicenseimage = File(pickedFile.path);
      notifyListeners();
    }
  }

  void removelicensebackimage() {
    _backlicenseimage = null;
    notifyListeners();
  }

  Future<void> pickdeliverymanImage(ImageSource source) async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      _deliverymanimage = File(pickedFile.path);
      notifyListeners();
    }
  }

  void removedeliverymanimage() {
    _deliverymanimage = null;
    notifyListeners();
  }
}
