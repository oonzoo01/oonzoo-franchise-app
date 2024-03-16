import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/api/api_service.dart';
import 'package:salesapp/provider/auth_provider/register_provider.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String? hashCodes;

  bool? _isLoading;
  bool? get isLoading => _isLoading;

  void restPasswordOtp(
      // partnerType,
      callback) async {
    _isLoading = true;
    notifyListeners();
    await APIService.restPasswordOtp(
      emailController.text,
      //  partnerType
    ).then(
      (value) {
        if (value != null) {
          hashCodes = value;
        } else {
          hashCodes = '';
        }
        callback(value);
      },
    );
    _isLoading = false;
    notifyListeners();
  }

  void restPasswordVerify(context, partnerType, callback) async {
    _isLoading = true;
    notifyListeners();
    await APIService.restPasswordVerify(
      emailController.text,
      partnerType,
      hashCodes ?? '',
      otpController.text,
      newPasswordController.text,
    ).then(
      (value) {
        if (value != null) {
          clearFrom(context);
        } else {}
        callback(value);
      },
    );
    _isLoading = false;
    notifyListeners();
  }

  String? isPasswordValid(String password) {
    // Define regular expressions for password criteria
    RegExp lowercaseRegex = RegExp(r'[a-z]');
    RegExp uppercaseRegex = RegExp(r'[A-Z]');
    RegExp digitRegex = RegExp(r'\d');
    RegExp specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

    // Check if the password meets all criteria
    bool hasLowercase = lowercaseRegex.hasMatch(password);
    bool hasUppercase = uppercaseRegex.hasMatch(password);
    bool hasDigit = digitRegex.hasMatch(password);
    bool hasSpecialChar = specialCharRegex.hasMatch(password);
    bool hasMinLength = password.length >= 8; // Minimum length of 8 characters

    // Return true if all criteria are met, String otherwise
    if (password.trim().isEmpty) {
      return "* Field Required";
    }
    if (!hasMinLength) {
      return 'Enter 8 Charecter';
    }
    if ((!hasLowercase) &&
        (!hasUppercase) &&
        (!hasDigit) &&
        (!hasSpecialChar)) {
      return 'Enter Strong Password';
    }
    return null;
    // return hasLowercase &&
    //     hasUppercase &&
    //     hasDigit &&
    //     hasSpecialChar &&
    //     hasMinLength;
  }

  clearFrom(context) {
    emailController.clear();
    otpController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
    hashCodes = null;
    Provider.of<RegisterProvider>(context, listen: false).timeDispose();
    notifyListeners();
  }
}
