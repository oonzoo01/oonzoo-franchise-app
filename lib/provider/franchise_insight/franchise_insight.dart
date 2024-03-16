import 'package:flutter/material.dart';
import 'package:salesapp/api/api_service.dart';
import 'package:salesapp/model/franchise_insight/franchise_insight.dart';

class FranchiseInsight extends ChangeNotifier {
  FranchiseInsightModel? _franchiseInsightDetails;
  FranchiseInsightModel? get franchiseInsightDetails =>
      _franchiseInsightDetails;

  String _createdOn = "Today";
  String get createdOn => _createdOn;

  setCreateOn(val) {
    _createdOn = val;
    notifyListeners();
    fetchFranchiseInsight();
  }

  void fetchFranchiseInsight() async {
    await APIService.getFranchiseInsight(_createdOn).then(
      (value) {
        if (value != null) {
          _franchiseInsightDetails = value;
        } else {
          _franchiseInsightDetails = const FranchiseInsightModel();
        }
      },
    );
    notifyListeners();
  }
}
