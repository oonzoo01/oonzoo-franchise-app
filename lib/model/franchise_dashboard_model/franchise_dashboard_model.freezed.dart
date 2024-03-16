// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'franchise_dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FranchiseDashboardModel _$FranchiseDashboardModelFromJson(
    Map<String, dynamic> json) {
  return _FranchiseDashboardModel.fromJson(json);
}

/// @nodoc
mixin _$FranchiseDashboardModel {
  int? get todayStores => throw _privateConstructorUsedError;
  int? get weeklyStores => throw _privateConstructorUsedError;
  int? get totalOnboardStores => throw _privateConstructorUsedError;
  int? get totalTeams => throw _privateConstructorUsedError;
  double? get totalEarning => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FranchiseDashboardModelCopyWith<FranchiseDashboardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FranchiseDashboardModelCopyWith<$Res> {
  factory $FranchiseDashboardModelCopyWith(FranchiseDashboardModel value,
          $Res Function(FranchiseDashboardModel) then) =
      _$FranchiseDashboardModelCopyWithImpl<$Res, FranchiseDashboardModel>;
  @useResult
  $Res call(
      {int? todayStores,
      int? weeklyStores,
      int? totalOnboardStores,
      int? totalTeams,
      double? totalEarning});
}

/// @nodoc
class _$FranchiseDashboardModelCopyWithImpl<$Res,
        $Val extends FranchiseDashboardModel>
    implements $FranchiseDashboardModelCopyWith<$Res> {
  _$FranchiseDashboardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todayStores = freezed,
    Object? weeklyStores = freezed,
    Object? totalOnboardStores = freezed,
    Object? totalTeams = freezed,
    Object? totalEarning = freezed,
  }) {
    return _then(_value.copyWith(
      todayStores: freezed == todayStores
          ? _value.todayStores
          : todayStores // ignore: cast_nullable_to_non_nullable
              as int?,
      weeklyStores: freezed == weeklyStores
          ? _value.weeklyStores
          : weeklyStores // ignore: cast_nullable_to_non_nullable
              as int?,
      totalOnboardStores: freezed == totalOnboardStores
          ? _value.totalOnboardStores
          : totalOnboardStores // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTeams: freezed == totalTeams
          ? _value.totalTeams
          : totalTeams // ignore: cast_nullable_to_non_nullable
              as int?,
      totalEarning: freezed == totalEarning
          ? _value.totalEarning
          : totalEarning // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FranchiseDashboardModelImplCopyWith<$Res>
    implements $FranchiseDashboardModelCopyWith<$Res> {
  factory _$$FranchiseDashboardModelImplCopyWith(
          _$FranchiseDashboardModelImpl value,
          $Res Function(_$FranchiseDashboardModelImpl) then) =
      __$$FranchiseDashboardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? todayStores,
      int? weeklyStores,
      int? totalOnboardStores,
      int? totalTeams,
      double? totalEarning});
}

/// @nodoc
class __$$FranchiseDashboardModelImplCopyWithImpl<$Res>
    extends _$FranchiseDashboardModelCopyWithImpl<$Res,
        _$FranchiseDashboardModelImpl>
    implements _$$FranchiseDashboardModelImplCopyWith<$Res> {
  __$$FranchiseDashboardModelImplCopyWithImpl(
      _$FranchiseDashboardModelImpl _value,
      $Res Function(_$FranchiseDashboardModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todayStores = freezed,
    Object? weeklyStores = freezed,
    Object? totalOnboardStores = freezed,
    Object? totalTeams = freezed,
    Object? totalEarning = freezed,
  }) {
    return _then(_$FranchiseDashboardModelImpl(
      todayStores: freezed == todayStores
          ? _value.todayStores
          : todayStores // ignore: cast_nullable_to_non_nullable
              as int?,
      weeklyStores: freezed == weeklyStores
          ? _value.weeklyStores
          : weeklyStores // ignore: cast_nullable_to_non_nullable
              as int?,
      totalOnboardStores: freezed == totalOnboardStores
          ? _value.totalOnboardStores
          : totalOnboardStores // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTeams: freezed == totalTeams
          ? _value.totalTeams
          : totalTeams // ignore: cast_nullable_to_non_nullable
              as int?,
      totalEarning: freezed == totalEarning
          ? _value.totalEarning
          : totalEarning // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FranchiseDashboardModelImpl implements _FranchiseDashboardModel {
  const _$FranchiseDashboardModelImpl(
      {this.todayStores,
      this.weeklyStores,
      this.totalOnboardStores,
      this.totalTeams,
      this.totalEarning});

  factory _$FranchiseDashboardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FranchiseDashboardModelImplFromJson(json);

  @override
  final int? todayStores;
  @override
  final int? weeklyStores;
  @override
  final int? totalOnboardStores;
  @override
  final int? totalTeams;
  @override
  final double? totalEarning;

  @override
  String toString() {
    return 'FranchiseDashboardModel(todayStores: $todayStores, weeklyStores: $weeklyStores, totalOnboardStores: $totalOnboardStores, totalTeams: $totalTeams, totalEarning: $totalEarning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FranchiseDashboardModelImpl &&
            (identical(other.todayStores, todayStores) ||
                other.todayStores == todayStores) &&
            (identical(other.weeklyStores, weeklyStores) ||
                other.weeklyStores == weeklyStores) &&
            (identical(other.totalOnboardStores, totalOnboardStores) ||
                other.totalOnboardStores == totalOnboardStores) &&
            (identical(other.totalTeams, totalTeams) ||
                other.totalTeams == totalTeams) &&
            (identical(other.totalEarning, totalEarning) ||
                other.totalEarning == totalEarning));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, todayStores, weeklyStores,
      totalOnboardStores, totalTeams, totalEarning);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FranchiseDashboardModelImplCopyWith<_$FranchiseDashboardModelImpl>
      get copyWith => __$$FranchiseDashboardModelImplCopyWithImpl<
          _$FranchiseDashboardModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FranchiseDashboardModelImplToJson(
      this,
    );
  }
}

abstract class _FranchiseDashboardModel implements FranchiseDashboardModel {
  const factory _FranchiseDashboardModel(
      {final int? todayStores,
      final int? weeklyStores,
      final int? totalOnboardStores,
      final int? totalTeams,
      final double? totalEarning}) = _$FranchiseDashboardModelImpl;

  factory _FranchiseDashboardModel.fromJson(Map<String, dynamic> json) =
      _$FranchiseDashboardModelImpl.fromJson;

  @override
  int? get todayStores;
  @override
  int? get weeklyStores;
  @override
  int? get totalOnboardStores;
  @override
  int? get totalTeams;
  @override
  double? get totalEarning;
  @override
  @JsonKey(ignore: true)
  _$$FranchiseDashboardModelImplCopyWith<_$FranchiseDashboardModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
