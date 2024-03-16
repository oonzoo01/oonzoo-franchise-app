import 'package:freezed_annotation/freezed_annotation.dart';
part 'franchise_insight.g.dart';
part 'franchise_insight.freezed.dart';

@freezed
class FranchiseInsightModel with _$FranchiseInsightModel {
  const factory FranchiseInsightModel({
    int? totalStores,
    double? totalEarning,
  }) = _FranchiseInsightModel;

  factory FranchiseInsightModel.fromJson(Map<String, dynamic> json) =>
      _$FranchiseInsightModelFromJson(json);
}
