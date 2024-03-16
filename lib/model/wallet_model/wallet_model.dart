import 'package:freezed_annotation/freezed_annotation.dart';
part 'wallet_model.freezed.dart';
part 'wallet_model.g.dart';

@freezed
class WalletModel with _$WalletModel {
  const factory WalletModel({
    int? total,
    int? page,
    int? pageSize,
    int? result,
    String? message,
    List<WalletDataModel>? data,
    double? walletBalance,
  }) = _WalletModel;

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);
}

@freezed
class WalletDataModel with _$WalletDataModel {
  const factory WalletDataModel({
    String? ID,
    String? storeName,
    String? userId,
    String? salesType,
    double? amount,
    String? transactionType,
    String? referenceNo,
    DateTime? transactionDate,
    bool? isPaymentApproved,
    String? auditProcess,
    String? auditRemarks,
  }) = _WalletDataModel;

  factory WalletDataModel.fromJson(Map<String, dynamic> json) =>
      _$WalletDataModelFromJson(json);
}
