// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_all_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberAllDetailsModelImpl _$$MemberAllDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MemberAllDetailsModelImpl(
      partnerId: json['partnerId'] as String?,
      userId: json['userId'] as String?,
      profilePic: json['profilePic'] as String?,
      fullName: json['fullName'] as String?,
      refCode: json['refCode'] as String?,
      registrationDate: json['registrationDate'] as String?,
      status: json['status'] as bool?,
      workCountry: json['workCountry'] as String?,
      nationality: json['nationality'] as String?,
      proofID: json['proofID'] as String?,
      proofIDNo: json['proofIDNo'] as String?,
      dateofBirth: json['dateofBirth'] == null
          ? null
          : DateTime.parse(json['dateofBirth'] as String),
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      proofIDFrontImage: json['proofIDFrontImage'] as String?,
      proofIDBackImage: json['proofIDBackImage'] as String?,
      drivingLicenseFrontImage: json['drivingLicenseFrontImage'] as String?,
      drivingLicenseBackImage: json['drivingLicenseBackImage'] as String?,
      age: json['age'] as int?,
    );

Map<String, dynamic> _$$MemberAllDetailsModelImplToJson(
        _$MemberAllDetailsModelImpl instance) =>
    <String, dynamic>{
      'partnerId': instance.partnerId,
      'userId': instance.userId,
      'profilePic': instance.profilePic,
      'fullName': instance.fullName,
      'refCode': instance.refCode,
      'registrationDate': instance.registrationDate,
      'status': instance.status,
      'workCountry': instance.workCountry,
      'nationality': instance.nationality,
      'proofID': instance.proofID,
      'proofIDNo': instance.proofIDNo,
      'dateofBirth': instance.dateofBirth?.toIso8601String(),
      'mobile': instance.mobile,
      'email': instance.email,
      'proofIDFrontImage': instance.proofIDFrontImage,
      'proofIDBackImage': instance.proofIDBackImage,
      'drivingLicenseFrontImage': instance.drivingLicenseFrontImage,
      'drivingLicenseBackImage': instance.drivingLicenseBackImage,
      'age': instance.age,
    };
