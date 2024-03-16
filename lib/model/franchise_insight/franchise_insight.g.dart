// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'franchise_insight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FranchiseInsightModelImpl _$$FranchiseInsightModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FranchiseInsightModelImpl(
      totalStores: json['totalStores'] as int?,
      totalEarning: (json['totalEarning'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$FranchiseInsightModelImplToJson(
        _$FranchiseInsightModelImpl instance) =>
    <String, dynamic>{
      'totalStores': instance.totalStores,
      'totalEarning': instance.totalEarning,
    };
