import 'package:flutter/material.dart';
import 'package:salesapp/api/api_service.dart';
import 'package:salesapp/model/wallet_model/wallet_model.dart';

class WalletProvider extends ChangeNotifier {
  WalletModel? _walletDetails;
  WalletModel? get walletDetails => _walletDetails;

  bool? _isLoading;
  bool? get isLoading => _isLoading;

  void fetchWalletTransactionHistory() async {
    _isLoading = true;
    notifyListeners();
    await APIService.getWalletTransactionHistory("1", "10").then(
      (value) {
        if (value != null) {
          _walletDetails = value;
        } else {
          _walletDetails = const WalletModel();
        }
      },
    );
    _isLoading = false;
    notifyListeners();
  }
}
