// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletModelImpl _$$WalletModelImplFromJson(Map<String, dynamic> json) =>
    _$WalletModelImpl(
      total: json['total'] as int?,
      page: json['page'] as int?,
      pageSize: json['pageSize'] as int?,
      result: json['result'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => WalletDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      walletBalance: (json['walletBalance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$WalletModelImplToJson(_$WalletModelImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'pageSize': instance.pageSize,
      'result': instance.result,
      'message': instance.message,
      'data': instance.data,
      'walletBalance': instance.walletBalance,
    };

_$WalletDataModelImpl _$$WalletDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WalletDataModelImpl(
      ID: json['ID'] as String?,
      storeName: json['storeName'] as String?,
      userId: json['userId'] as String?,
      salesType: json['salesType'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      transactionType: json['transactionType'] as String?,
      referenceNo: json['referenceNo'] as String?,
      transactionDate: json['transactionDate'] == null
          ? null
          : DateTime.parse(json['transactionDate'] as String),
      isPaymentApproved: json['isPaymentApproved'] as bool?,
      auditProcess: json['auditProcess'] as String?,
      auditRemarks: json['auditRemarks'] as String?,
    );

Map<String, dynamic> _$$WalletDataModelImplToJson(
        _$WalletDataModelImpl instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'storeName': instance.storeName,
      'userId': instance.userId,
      'salesType': instance.salesType,
      'amount': instance.amount,
      'transactionType': instance.transactionType,
      'referenceNo': instance.referenceNo,
      'transactionDate': instance.transactionDate?.toIso8601String(),
      'isPaymentApproved': instance.isPaymentApproved,
      'auditProcess': instance.auditProcess,
      'auditRemarks': instance.auditRemarks,
    };
