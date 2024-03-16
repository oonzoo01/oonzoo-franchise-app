// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'franchise_insight.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FranchiseInsightModel _$FranchiseInsightModelFromJson(
    Map<String, dynamic> json) {
  return _FranchiseInsightModel.fromJson(json);
}

/// @nodoc
mixin _$FranchiseInsightModel {
  int? get totalStores => throw _privateConstructorUsedError;
  double? get totalEarning => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FranchiseInsightModelCopyWith<FranchiseInsightModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FranchiseInsightModelCopyWith<$Res> {
  factory $FranchiseInsightModelCopyWith(FranchiseInsightModel value,
          $Res Function(FranchiseInsightModel) then) =
      _$FranchiseInsightModelCopyWithImpl<$Res, FranchiseInsightModel>;
  @useResult
  $Res call({int? totalStores, double? totalEarning});
}

/// @nodoc
class _$FranchiseInsightModelCopyWithImpl<$Res,
        $Val extends FranchiseInsightModel>
    implements $FranchiseInsightModelCopyWith<$Res> {
  _$FranchiseInsightModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalStores = freezed,
    Object? totalEarning = freezed,
  }) {
    return _then(_value.copyWith(
      totalStores: freezed == totalStores
          ? _value.totalStores
          : totalStores // ignore: cast_nullable_to_non_nullable
              as int?,
      totalEarning: freezed == totalEarning
          ? _value.totalEarning
          : totalEarning // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FranchiseInsightModelImplCopyWith<$Res>
    implements $FranchiseInsightModelCopyWith<$Res> {
  factory _$$FranchiseInsightModelImplCopyWith(
          _$FranchiseInsightModelImpl value,
          $Res Function(_$FranchiseInsightModelImpl) then) =
      __$$FranchiseInsightModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? totalStores, double? totalEarning});
}

/// @nodoc
class __$$FranchiseInsightModelImplCopyWithImpl<$Res>
    extends _$FranchiseInsightModelCopyWithImpl<$Res,
        _$FranchiseInsightModelImpl>
    implements _$$FranchiseInsightModelImplCopyWith<$Res> {
  __$$FranchiseInsightModelImplCopyWithImpl(_$FranchiseInsightModelImpl _value,
      $Res Function(_$FranchiseInsightModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalStores = freezed,
    Object? totalEarning = freezed,
  }) {
    return _then(_$FranchiseInsightModelImpl(
      totalStores: freezed == totalStores
          ? _value.totalStores
          : totalStores // ignore: cast_nullable_to_non_nullable
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
class _$FranchiseInsightModelImpl implements _FranchiseInsightModel {
  const _$FranchiseInsightModelImpl({this.totalStores, this.totalEarning});

  factory _$FranchiseInsightModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FranchiseInsightModelImplFromJson(json);

  @override
  final int? totalStores;
  @override
  final double? totalEarning;

  @override
  String toString() {
    return 'FranchiseInsightModel(totalStores: $totalStores, totalEarning: $totalEarning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FranchiseInsightModelImpl &&
            (identical(other.totalStores, totalStores) ||
                other.totalStores == totalStores) &&
            (identical(other.totalEarning, totalEarning) ||
                other.totalEarning == totalEarning));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalStores, totalEarning);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FranchiseInsightModelImplCopyWith<_$FranchiseInsightModelImpl>
      get copyWith => __$$FranchiseInsightModelImplCopyWithImpl<
          _$FranchiseInsightModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FranchiseInsightModelImplToJson(
      this,
    );
  }
}

abstract class _FranchiseInsightModel implements FranchiseInsightModel {
  const factory _FranchiseInsightModel(
      {final int? totalStores,
      final double? totalEarning}) = _$FranchiseInsightModelImpl;

  factory _FranchiseInsightModel.fromJson(Map<String, dynamic> json) =
      _$FranchiseInsightModelImpl.fromJson;

  @override
  int? get totalStores;
  @override
  double? get totalEarning;
  @override
  @JsonKey(ignore: true)
  _$$FranchiseInsightModelImplCopyWith<_$FranchiseInsightModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
