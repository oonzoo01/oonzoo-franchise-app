import 'package:flutter/material.dart';
import 'package:salesapp/api/api_service.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController franchiseCode = TextEditingController();

  String? _selectedPartnerType;
  String? get selectedPartnerType => _selectedPartnerType;

  bool _readOnly = true;
  bool get readOnly => _readOnly;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _drop;
  String? get drop => _drop;

  setDropValue(val) {
    _drop = val;
    notifyListeners();
  }

  void partnerLogin(callback) async {
    _isLoading = true;
    notifyListeners();
    final res = await APIService.partnerLogin(
      email.text.trim(),
      password.text,
      _selectedPartnerType?.trim() ?? '',
      franchiseCode.text.trim(),
    );

    if (res) {
      clearForm();
    }
    _isLoading = false;
    notifyListeners();
    callback(res);
  }

  void setReadOnly(val) {
    _readOnly = val;
    notifyListeners();
  }

  void setSelectedPartner(val) {
    _selectedPartnerType = val;
    notifyListeners();
  }

  void clearForm({bool isNotPartner = false}) {
    email.clear();
    password.clear();
    franchiseCode.clear();
    if (!isNotPartner) {
      _selectedPartnerType = null;
    }
    notifyListeners();
  }
}
