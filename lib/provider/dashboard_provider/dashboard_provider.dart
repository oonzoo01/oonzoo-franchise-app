import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/api/api_service.dart';
import 'package:salesapp/model/on_oboard_store_model/on_oboard_store_model.dart';
import 'package:salesapp/model/search_store_details/search_store_details.dart';

import '../loader_provider/loader_provider.dart';

enum LoadMoreStatus { INITIAL, LOADING, STABLE }

class DashboardProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  List<SearchStoreDetails>? _searchStoreList;
  List<SearchStoreDetails>? get searchStoreList => _searchStoreList;

  OnBoardstoreModel? _onBoardStoreModel;
  OnBoardstoreModel? get onBoardStoreModel => _onBoardStoreModel;

  List<OnBoardStoreListModel> _onBoardStoreList = [];
  List<OnBoardStoreListModel> get onBoardStoreList => _onBoardStoreList;

  String? _whitelabelStatus;
  String? get whitelabelStatus => _whitelabelStatus;

  bool? _isLoading;
  bool? get isLoading => _isLoading;

  String? _createdAt;
  String? get createdAt => _createdAt;

  List<DateTime?>? _customDates;
  List<DateTime?>? get customDates => _customDates;

  int _pageNumber = 1;
  int get pageNumber => _pageNumber;

  DashboardProvider() {
    _customDates = [];
    notifyListeners();
  }
  setPageNumber(val) {
    _pageNumber = val;
    notifyListeners();
  }

  setWhiteLabelStatus(val, ctx) {
    _whitelabelStatus = val;
    notifyListeners();
    fetchFreelancerOnboardStores(ctx, 1);
  }

  setCreatedOn(String val, ctx) {
    _createdAt = val;
    notifyListeners();
    fetchFreelancerOnboardStores(ctx, 1);
  }

  setCustomDates(val, ctx) {
    _customDates = val;
    _createdAt = "Custom";
    notifyListeners();
    fetchFreelancerOnboardStores(ctx, 1);
  }

  void nonWhiteLabelSearch() async {
    if (searchController.text.trim() != '') {
      await APIService.searchNonWhiteLabelStore(
        searchController.text,
        createdAt ?? '',
        customDates ?? [],
        whitelabelStatus: whitelabelStatus,
      ).then((value) {
        if (value != null) {
          _searchStoreList = value;
        } else {
          _searchStoreList = [];
        }
      });
    } else {
      _searchStoreList = [];
    }

    notifyListeners();
  }

  void fetchFreelancerOnboardStores(ctx, page) async {
    if (page == 1) {  
      _isLoading = true;
      _onBoardStoreList.clear();
      notifyListeners();
    }
    await APIService.getFreelancerOnboardStore(
      page.toString(),
      "10",
      createdAt ?? '',
      customDates ?? [],
      whitelabelStatus: whitelabelStatus,
    ).then((value) {
      if (value != null) {
        _onBoardStoreModel = value;
        if (value.data != null) {
          _onBoardStoreList.addAll(value.data!);
        } else {
          _onBoardStoreList.addAll([]);
        }
      } else {
        _onBoardStoreModel = null;
        _onBoardStoreList.addAll([]);
      }
    });
    if (page > 1) {
      Provider.of<LoaderProvider>(ctx, listen: false).setIsLoading(false);
    }
    _isLoading = false;
    notifyListeners();
  }

  void registerStoreAsWhitelabel(storeId, callback) async {
    final res = await APIService.registerStoreAsWhitelabel(storeId);
    callback(res);
    nonWhiteLabelSearch();
  }

  void addAuditRequest(storeId, callback) async {
    final res = await APIService.addAuditRequest(storeId);
    callback(res);
  }

  clearFilter() {
    _createdAt = null;
    _customDates = [];
    notifyListeners();
  }

  clearSearchField() {
    searchController.clear();
    nonWhiteLabelSearch();
    notifyListeners();
  }
}
