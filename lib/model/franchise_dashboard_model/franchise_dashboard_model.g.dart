// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'franchise_dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FranchiseDashboardModelImpl _$$FranchiseDashboardModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FranchiseDashboardModelImpl(
      todayStores: json['todayStores'] as int?,
      weeklyStores: json['weeklyStores'] as int?,
      totalOnboardStores: json['totalOnboardStores'] as int?,
      totalTeams: json['totalTeams'] as int?,
      totalEarning: (json['totalEarning'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$FranchiseDashboardModelImplToJson(
        _$FranchiseDashboardModelImpl instance) =>
    <String, dynamic>{
      'todayStores': instance.todayStores,
      'weeklyStores': instance.weeklyStores,
      'totalOnboardStores': instance.totalOnboardStores,
      'totalTeams': instance.totalTeams,
      'totalEarning': instance.totalEarning,
    };
