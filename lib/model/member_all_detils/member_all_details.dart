import 'package:freezed_annotation/freezed_annotation.dart';
part 'member_all_details.freezed.dart';
part 'member_all_details.g.dart';

@freezed
class MemberAllDetailsModel with _$MemberAllDetailsModel {
  const factory MemberAllDetailsModel({
    String? partnerId,
    String? userId,
    String? profilePic,
    String? fullName,
    String? refCode,
    String? registrationDate,
    bool? status,
    String? workCountry,
    String? nationality,
    String? proofID,
    String? proofIDNo,
    DateTime? dateofBirth,
    String? mobile,
    String? email,
    String? proofIDFrontImage,
    String? proofIDBackImage,
    String? drivingLicenseFrontImage,
    String? drivingLicenseBackImage,
    int? age,
  }) = _MemberAllDetailsModel;

  factory MemberAllDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MemberAllDetailsModelFromJson(json);
}
