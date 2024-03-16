import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/api/api_service.dart';

import '../../model/on_oboard_store_model/on_oboard_store_model.dart';
import '../loader_provider/loader_provider.dart';

class FranchiseOnboardStoreProvider extends ChangeNotifier {
  int _pageNumber = 1;
  int get pageNumber => _pageNumber;

  String? _createdAt;
  String? get createdAt => _createdAt;

  String? _createdMemberAt;
  String? get createdMemberAt => _createdMemberAt;

  List<DateTime?>? _customDates;
  List<DateTime?>? get customDates => _customDates;

  String? _whitelabelStatus;
  String? get whitelabelStatus => _whitelabelStatus;

  bool? _isLoading;
  bool? get isLoading => _isLoading;

  String? _selectedId;
  String? get selectedId => _selectedId;

  OnBoardstoreModel? _onBoardStoreModel;
  OnBoardstoreModel? get onBoardStoreModel => _onBoardStoreModel;

  List<OnBoardStoreListModel> _franchiseOnBoardStoreList = [];
  List<OnBoardStoreListModel> get franchiseOnBoardStoreList =>
      _franchiseOnBoardStoreList;

  FranchiseOnboardStoreProvider() {
    _whitelabelStatus = 'All';
    // _createdAt = 'Today';
    _customDates = [];
    notifyListeners();
  }

  setFreelancerId(val) {
    _selectedId = val;
    notifyListeners();
  }

  setPageNumber(val) {
    _pageNumber = val;
    notifyListeners();
  }

  setWhiteLabelStatus(val, ctx) {
    _whitelabelStatus = val;
    notifyListeners();
    fetchFranchiseOnboardStore(ctx, 1);
  }

  setCreatedOn(val, ctx) {
    _createdAt = val;
    notifyListeners();
    fetchFranchiseOnboardStore(ctx, 1);
  }

  setMemberCreatedOn(val) {
    _createdMemberAt = val;
    notifyListeners();
  }

  setCustomDates(val, ctx) {
    _customDates = val;
    _createdAt = "Custom";
    notifyListeners();
    fetchFranchiseOnboardStore(ctx, 1);
  }

  void fetchFranchiseOnboardStore(
    BuildContext ctx,
    int page,
  ) async {
    if (page == 1) {
      _isLoading = true;
      _franchiseOnBoardStoreList.clear();
      notifyListeners();
    }
    await APIService.getFranchiseOnboardStore(
      page.toString(),
      "10",
      _createdAt ?? '',
      _customDates ?? [],
      selectedId ?? '',
      whitelabelStatus: _whitelabelStatus,
    ).then(
      (value) {
        if (value != null) {
          _onBoardStoreModel = value;
          if (value.data != null) {
            _franchiseOnBoardStoreList.addAll(value.data!);
          } else {
            _franchiseOnBoardStoreList.addAll([]);
          }
        } else {
          _onBoardStoreModel = null;
          _franchiseOnBoardStoreList.addAll([]);
        }
      },
    );
    if (page > 1) {
      // ignore: use_build_context_synchronously
      Provider.of<LoaderProvider>(ctx, listen: false).setIsLoading(false);
    }
    _isLoading = false;
    notifyListeners();
  }
}
