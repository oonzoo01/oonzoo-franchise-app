import 'package:freezed_annotation/freezed_annotation.dart';
part 'franchise_member_model.freezed.dart';
part 'franchise_member_model.g.dart';

@freezed
class FranchiseModel with _$FranchiseModel {
  const factory FranchiseModel({
    int? total,
    int? activeCount,
    int? inactiveCount,
    int? page,
    int? pageSize,
    int? result,
    String? message,
    List<FranchiseMemberModel>? data,
  }) = _FranchiseModel;

  factory FranchiseModel.fromJson(Map<String, dynamic> json) =>
      _$FranchiseModelFromJson(json);
}

@freezed
class FranchiseMemberModel with _$FranchiseMemberModel {
  const factory FranchiseMemberModel({
    String? userId,
    String? profilePic,
    String? fullName,
    String? refCode,
    DateTime? registrationDate,
    bool? status,
  }) = _FranchiseMemberModel;

  factory FranchiseMemberModel.fromJson(Map<String, dynamic> json) =>
      _$FranchiseMemberModelFromJson(json);

  static List<FranchiseMemberModel> fromList(dynamic json) {
    List<FranchiseMemberModel> list = [];
    if (json != null && json is List) {
      for (var item in json) {
        list.add(FranchiseMemberModel.fromJson(item));
      }
    }

    return list;
  }
}
