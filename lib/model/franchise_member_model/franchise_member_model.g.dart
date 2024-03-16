// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'franchise_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FranchiseModelImpl _$$FranchiseModelImplFromJson(Map<String, dynamic> json) =>
    _$FranchiseModelImpl(
      total: json['total'] as int?,
      activeCount: json['activeCount'] as int?,
      inactiveCount: json['inactiveCount'] as int?,
      page: json['page'] as int?,
      pageSize: json['pageSize'] as int?,
      result: json['result'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FranchiseMemberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FranchiseModelImplToJson(
        _$FranchiseModelImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'activeCount': instance.activeCount,
      'inactiveCount': instance.inactiveCount,
      'page': instance.page,
      'pageSize': instance.pageSize,
      'result': instance.result,
      'message': instance.message,
      'data': instance.data,
    };

_$FranchiseMemberModelImpl _$$FranchiseMemberModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FranchiseMemberModelImpl(
      userId: json['userId'] as String?,
      profilePic: json['profilePic'] as String?,
      fullName: json['fullName'] as String?,
      refCode: json['refCode'] as String?,
      registrationDate: json['registrationDate'] == null
          ? null
          : DateTime.parse(json['registrationDate'] as String),
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$$FranchiseMemberModelImplToJson(
        _$FranchiseMemberModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'profilePic': instance.profilePic,
      'fullName': instance.fullName,
      'refCode': instance.refCode,
      'registrationDate': instance.registrationDate?.toIso8601String(),
      'status': instance.status,
    };
