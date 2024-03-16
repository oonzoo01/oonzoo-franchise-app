import 'package:flutter/material.dart';
import 'package:salesapp/api/api_service.dart';
import 'package:salesapp/model/franchise_dashboard_model/franchise_dashboard_model.dart';

class FranchiseDashboardProvider extends ChangeNotifier {
  FranchiseDashboardModel? _franchiseDashboardDetails;
  FranchiseDashboardModel? get franchiseDashboardDetails =>
      _franchiseDashboardDetails;

  bool? _isLoading;
  bool? get isLoading => _isLoading;

  void fetchFranchiseDasboard() async {
    _isLoading = true;
    notifyListeners();
    await APIService.getFranchiseDashboard().then(
      (value) {
        if (value != null) {
          _franchiseDashboardDetails = value;
          notifyListeners();
        } else {
          _franchiseDashboardDetails = const FranchiseDashboardModel();
        }
      },
    );
    _isLoading = false;
    notifyListeners();
  }
}
