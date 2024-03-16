import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
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
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}
