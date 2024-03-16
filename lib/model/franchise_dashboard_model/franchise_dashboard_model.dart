import 'package:freezed_annotation/freezed_annotation.dart';
part 'franchise_dashboard_model.freezed.dart';
part 'franchise_dashboard_model.g.dart';

@freezed
class FranchiseDashboardModel with _$FranchiseDashboardModel {
  const factory FranchiseDashboardModel({
    int? todayStores,
    int? weeklyStores,
    int? totalOnboardStores,
    int? totalTeams,
    double? totalEarning,
  }) = _FranchiseDashboardModel;

  factory FranchiseDashboardModel.fromJson(Map<String, dynamic> json) =>
      _$FranchiseDashboardModelFromJson(json);
}
