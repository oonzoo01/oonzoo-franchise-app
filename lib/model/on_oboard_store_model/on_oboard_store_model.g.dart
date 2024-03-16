// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'on_oboard_store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnBoardstoreModelImpl _$$OnBoardstoreModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OnBoardstoreModelImpl(
      total: json['total'] as int?,
      page: json['page'] as int?,
      pageSize: json['pageSize'] as int?,
      result: json['result'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => OnBoardStoreListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OnBoardstoreModelImplToJson(
        _$OnBoardstoreModelImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'pageSize': instance.pageSize,
      'result': instance.result,
      'message': instance.message,
      'data': instance.data,
    };

_$OnBoardStoreListModelImpl _$$OnBoardStoreListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OnBoardStoreListModelImpl(
      ID: json['ID'] as String?,
      storeName: json['storeName'] as String?,
      userId: json['userId'] as String?,
      storeCategory: json['storeCategory'] as String?,
      storeContactDetails: json['storeContactDetails'] as String?,
      storeProfilePic: json['storeProfilePic'] as String?,
      createdAt: json['createdAt'] as String?,
      isPlanUpgraded: json['isPlanUpgraded'] as bool?,
      isWhiteLabelApp: json['isWhiteLabelApp'] as bool?,
      onboardAuditProcess: json['onboardAuditProcess'] as String?,
      whitelabelAuditProcess: json['whitelabelAuditProcess'] as String?,
    );

Map<String, dynamic> _$$OnBoardStoreListModelImplToJson(
        _$OnBoardStoreListModelImpl instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'storeName': instance.storeName,
      'userId': instance.userId,
      'storeCategory': instance.storeCategory,
      'storeContactDetails': instance.storeContactDetails,
      'storeProfilePic': instance.storeProfilePic,
      'createdAt': instance.createdAt,
      'isPlanUpgraded': instance.isPlanUpgraded,
      'isWhiteLabelApp': instance.isWhiteLabelApp,
      'onboardAuditProcess': instance.onboardAuditProcess,
      'whitelabelAuditProcess': instance.whitelabelAuditProcess,
    };
