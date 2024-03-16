// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      ID: json['ID'] as String?,
      refCode: json['refCode'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      profilePic: json['profilePic'] as String?,
      frontIDCard: json['frontIDCard'] as String?,
      backIDCard: json['backIDCard'] as String?,
      visitingCard: json['visitingCard'] as String?,
      roles: json['roles'] as List<dynamic>?,
      userId: json['userId'] as String?,
      token: json['token'] as String?,
      data1: json['data1'] as String?,
      ModulePermissions: json['ModulePermissions'] as List<dynamic>?,
      partnerType: json['partnerType'] as String?,
      partnerRegistered: json['partnerRegistered'] as bool?,
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'refCode': instance.refCode,
      'fullName': instance.fullName,
      'email': instance.email,
      'mobile': instance.mobile,
      'profilePic': instance.profilePic,
      'frontIDCard': instance.frontIDCard,
      'backIDCard': instance.backIDCard,
      'visitingCard': instance.visitingCard,
      'roles': instance.roles,
      'userId': instance.userId,
      'token': instance.token,
      'data1': instance.data1,
      'ModulePermissions': instance.ModulePermissions,
      'partnerType': instance.partnerType,
      'partnerRegistered': instance.partnerRegistered,
    };
