// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'on_oboard_store_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OnBoardstoreModel _$OnBoardstoreModelFromJson(Map<String, dynamic> json) {
  return _OnBoardstoreModel.fromJson(json);
}

/// @nodoc
mixin _$OnBoardstoreModel {
  int? get total => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  int? get pageSize => throw _privateConstructorUsedError;
  int? get result => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<OnBoardStoreListModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OnBoardstoreModelCopyWith<OnBoardstoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnBoardstoreModelCopyWith<$Res> {
  factory $OnBoardstoreModelCopyWith(
          OnBoardstoreModel value, $Res Function(OnBoardstoreModel) then) =
      _$OnBoardstoreModelCopyWithImpl<$Res, OnBoardstoreModel>;
  @useResult
  $Res call(
      {int? total,
      int? page,
      int? pageSize,
      int? result,
      String? message,
      List<OnBoardStoreListModel>? data});
}

/// @nodoc
class _$OnBoardstoreModelCopyWithImpl<$Res, $Val extends OnBoardstoreModel>
    implements $OnBoardstoreModelCopyWith<$Res> {
  _$OnBoardstoreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? page = freezed,
    Object? pageSize = freezed,
    Object? result = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<OnBoardStoreListModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnBoardstoreModelImplCopyWith<$Res>
    implements $OnBoardstoreModelCopyWith<$Res> {
  factory _$$OnBoardstoreModelImplCopyWith(_$OnBoardstoreModelImpl value,
          $Res Function(_$OnBoardstoreModelImpl) then) =
      __$$OnBoardstoreModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? total,
      int? page,
      int? pageSize,
      int? result,
      String? message,
      List<OnBoardStoreListModel>? data});
}

/// @nodoc
class __$$OnBoardstoreModelImplCopyWithImpl<$Res>
    extends _$OnBoardstoreModelCopyWithImpl<$Res, _$OnBoardstoreModelImpl>
    implements _$$OnBoardstoreModelImplCopyWith<$Res> {
  __$$OnBoardstoreModelImplCopyWithImpl(_$OnBoardstoreModelImpl _value,
      $Res Function(_$OnBoardstoreModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? page = freezed,
    Object? pageSize = freezed,
    Object? result = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$OnBoardstoreModelImpl(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<OnBoardStoreListModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OnBoardstoreModelImpl implements _OnBoardstoreModel {
  const _$OnBoardstoreModelImpl(
      {this.total,
      this.page,
      this.pageSize,
      this.result,
      this.message,
      final List<OnBoardStoreListModel>? data})
      : _data = data;

  factory _$OnBoardstoreModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OnBoardstoreModelImplFromJson(json);

  @override
  final int? total;
  @override
  final int? page;
  @override
  final int? pageSize;
  @override
  final int? result;
  @override
  final String? message;
  final List<OnBoardStoreListModel>? _data;
  @override
  List<OnBoardStoreListModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OnBoardstoreModel(total: $total, page: $page, pageSize: $pageSize, result: $result, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnBoardstoreModelImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total, page, pageSize, result,
      message, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnBoardstoreModelImplCopyWith<_$OnBoardstoreModelImpl> get copyWith =>
      __$$OnBoardstoreModelImplCopyWithImpl<_$OnBoardstoreModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OnBoardstoreModelImplToJson(
      this,
    );
  }
}

abstract class _OnBoardstoreModel implements OnBoardstoreModel {
  const factory _OnBoardstoreModel(
      {final int? total,
      final int? page,
      final int? pageSize,
      final int? result,
      final String? message,
      final List<OnBoardStoreListModel>? data}) = _$OnBoardstoreModelImpl;

  factory _OnBoardstoreModel.fromJson(Map<String, dynamic> json) =
      _$OnBoardstoreModelImpl.fromJson;

  @override
  int? get total;
  @override
  int? get page;
  @override
  int? get pageSize;
  @override
  int? get result;
  @override
  String? get message;
  @override
  List<OnBoardStoreListModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$OnBoardstoreModelImplCopyWith<_$OnBoardstoreModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OnBoardStoreListModel _$OnBoardStoreListModelFromJson(
    Map<String, dynamic> json) {
  return _OnBoardStoreListModel.fromJson(json);
}

/// @nodoc
mixin _$OnBoardStoreListModel {
  String? get ID => throw _privateConstructorUsedError;
  String? get storeName => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get storeCategory => throw _privateConstructorUsedError;
  String? get storeContactDetails => throw _privateConstructorUsedError;
  String? get storeProfilePic => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  bool? get isPlanUpgraded => throw _privateConstructorUsedError;
  bool? get isWhiteLabelApp => throw _privateConstructorUsedError;
  String? get onboardAuditProcess => throw _privateConstructorUsedError;
  String? get whitelabelAuditProcess => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OnBoardStoreListModelCopyWith<OnBoardStoreListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnBoardStoreListModelCopyWith<$Res> {
  factory $OnBoardStoreListModelCopyWith(OnBoardStoreListModel value,
          $Res Function(OnBoardStoreListModel) then) =
      _$OnBoardStoreListModelCopyWithImpl<$Res, OnBoardStoreListModel>;
  @useResult
  $Res call(
      {String? ID,
      String? storeName,
      String? userId,
      String? storeCategory,
      String? storeContactDetails,
      String? storeProfilePic,
      String? createdAt,
      bool? isPlanUpgraded,
      bool? isWhiteLabelApp,
      String? onboardAuditProcess,
      String? whitelabelAuditProcess});
}

/// @nodoc
class _$OnBoardStoreListModelCopyWithImpl<$Res,
        $Val extends OnBoardStoreListModel>
    implements $OnBoardStoreListModelCopyWith<$Res> {
  _$OnBoardStoreListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ID = freezed,
    Object? storeName = freezed,
    Object? userId = freezed,
    Object? storeCategory = freezed,
    Object? storeContactDetails = freezed,
    Object? storeProfilePic = freezed,
    Object? createdAt = freezed,
    Object? isPlanUpgraded = freezed,
    Object? isWhiteLabelApp = freezed,
    Object? onboardAuditProcess = freezed,
    Object? whitelabelAuditProcess = freezed,
  }) {
    return _then(_value.copyWith(
      ID: freezed == ID
          ? _value.ID
          : ID // ignore: cast_nullable_to_non_nullable
              as String?,
      storeName: freezed == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      storeCategory: freezed == storeCategory
          ? _value.storeCategory
          : storeCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      storeContactDetails: freezed == storeContactDetails
          ? _value.storeContactDetails
          : storeContactDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      storeProfilePic: freezed == storeProfilePic
          ? _value.storeProfilePic
          : storeProfilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isPlanUpgraded: freezed == isPlanUpgraded
          ? _value.isPlanUpgraded
          : isPlanUpgraded // ignore: cast_nullable_to_non_nullable
              as bool?,
      isWhiteLabelApp: freezed == isWhiteLabelApp
          ? _value.isWhiteLabelApp
          : isWhiteLabelApp // ignore: cast_nullable_to_non_nullable
              as bool?,
      onboardAuditProcess: freezed == onboardAuditProcess
          ? _value.onboardAuditProcess
          : onboardAuditProcess // ignore: cast_nullable_to_non_nullable
              as String?,
      whitelabelAuditProcess: freezed == whitelabelAuditProcess
          ? _value.whitelabelAuditProcess
          : whitelabelAuditProcess // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnBoardStoreListModelImplCopyWith<$Res>
    implements $OnBoardStoreListModelCopyWith<$Res> {
  factory _$$OnBoardStoreListModelImplCopyWith(
          _$OnBoardStoreListModelImpl value,
          $Res Function(_$OnBoardStoreListModelImpl) then) =
      __$$OnBoardStoreListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? ID,
      String? storeName,
      String? userId,
      String? storeCategory,
      String? storeContactDetails,
      String? storeProfilePic,
      String? createdAt,
      bool? isPlanUpgraded,
      bool? isWhiteLabelApp,
      String? onboardAuditProcess,
      String? whitelabelAuditProcess});
}

/// @nodoc
class __$$OnBoardStoreListModelImplCopyWithImpl<$Res>
    extends _$OnBoardStoreListModelCopyWithImpl<$Res,
        _$OnBoardStoreListModelImpl>
    implements _$$OnBoardStoreListModelImplCopyWith<$Res> {
  __$$OnBoardStoreListModelImplCopyWithImpl(_$OnBoardStoreListModelImpl _value,
      $Res Function(_$OnBoardStoreListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ID = freezed,
    Object? storeName = freezed,
    Object? userId = freezed,
    Object? storeCategory = freezed,
    Object? storeContactDetails = freezed,
    Object? storeProfilePic = freezed,
    Object? createdAt = freezed,
    Object? isPlanUpgraded = freezed,
    Object? isWhiteLabelApp = freezed,
    Object? onboardAuditProcess = freezed,
    Object? whitelabelAuditProcess = freezed,
  }) {
    return _then(_$OnBoardStoreListModelImpl(
      ID: freezed == ID
          ? _value.ID
          : ID // ignore: cast_nullable_to_non_nullable
              as String?,
      storeName: freezed == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      storeCategory: freezed == storeCategory
          ? _value.storeCategory
          : storeCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      storeContactDetails: freezed == storeContactDetails
          ? _value.storeContactDetails
          : storeContactDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      storeProfilePic: freezed == storeProfilePic
          ? _value.storeProfilePic
          : storeProfilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isPlanUpgraded: freezed == isPlanUpgraded
          ? _value.isPlanUpgraded
          : isPlanUpgraded // ignore: cast_nullable_to_non_nullable
              as bool?,
      isWhiteLabelApp: freezed == isWhiteLabelApp
          ? _value.isWhiteLabelApp
          : isWhiteLabelApp // ignore: cast_nullable_to_non_nullable
              as bool?,
      onboardAuditProcess: freezed == onboardAuditProcess
          ? _value.onboardAuditProcess
          : onboardAuditProcess // ignore: cast_nullable_to_non_nullable
              as String?,
      whitelabelAuditProcess: freezed == whitelabelAuditProcess
          ? _value.whitelabelAuditProcess
          : whitelabelAuditProcess // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OnBoardStoreListModelImpl implements _OnBoardStoreListModel {
  const _$OnBoardStoreListModelImpl(
      {this.ID,
      this.storeName,
      this.userId,
      this.storeCategory,
      this.storeContactDetails,
      this.storeProfilePic,
      this.createdAt,
      this.isPlanUpgraded,
      this.isWhiteLabelApp,
      this.onboardAuditProcess,
      this.whitelabelAuditProcess});

  factory _$OnBoardStoreListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OnBoardStoreListModelImplFromJson(json);

  @override
  final String? ID;
  @override
  final String? storeName;
  @override
  final String? userId;
  @override
  final String? storeCategory;
  @override
  final String? storeContactDetails;
  @override
  final String? storeProfilePic;
  @override
  final String? createdAt;
  @override
  final bool? isPlanUpgraded;
  @override
  final bool? isWhiteLabelApp;
  @override
  final String? onboardAuditProcess;
  @override
  final String? whitelabelAuditProcess;

  @override
  String toString() {
    return 'OnBoardStoreListModel(ID: $ID, storeName: $storeName, userId: $userId, storeCategory: $storeCategory, storeContactDetails: $storeContactDetails, storeProfilePic: $storeProfilePic, createdAt: $createdAt, isPlanUpgraded: $isPlanUpgraded, isWhiteLabelApp: $isWhiteLabelApp, onboardAuditProcess: $onboardAuditProcess, whitelabelAuditProcess: $whitelabelAuditProcess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnBoardStoreListModelImpl &&
            (identical(other.ID, ID) || other.ID == ID) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.storeCategory, storeCategory) ||
                other.storeCategory == storeCategory) &&
            (identical(other.storeContactDetails, storeContactDetails) ||
                other.storeContactDetails == storeContactDetails) &&
            (identical(other.storeProfilePic, storeProfilePic) ||
                other.storeProfilePic == storeProfilePic) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isPlanUpgraded, isPlanUpgraded) ||
                other.isPlanUpgraded == isPlanUpgraded) &&
            (identical(other.isWhiteLabelApp, isWhiteLabelApp) ||
                other.isWhiteLabelApp == isWhiteLabelApp) &&
            (identical(other.onboardAuditProcess, onboardAuditProcess) ||
                other.onboardAuditProcess == onboardAuditProcess) &&
            (identical(other.whitelabelAuditProcess, whitelabelAuditProcess) ||
                other.whitelabelAuditProcess == whitelabelAuditProcess));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      ID,
      storeName,
      userId,
      storeCategory,
      storeContactDetails,
      storeProfilePic,
      createdAt,
      isPlanUpgraded,
      isWhiteLabelApp,
      onboardAuditProcess,
      whitelabelAuditProcess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnBoardStoreListModelImplCopyWith<_$OnBoardStoreListModelImpl>
      get copyWith => __$$OnBoardStoreListModelImplCopyWithImpl<
          _$OnBoardStoreListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OnBoardStoreListModelImplToJson(
      this,
    );
  }
}

abstract class _OnBoardStoreListModel implements OnBoardStoreListModel {
  const factory _OnBoardStoreListModel(
      {final String? ID,
      final String? storeName,
      final String? userId,
      final String? storeCategory,
      final String? storeContactDetails,
      final String? storeProfilePic,
      final String? createdAt,
      final bool? isPlanUpgraded,
      final bool? isWhiteLabelApp,
      final String? onboardAuditProcess,
      final String? whitelabelAuditProcess}) = _$OnBoardStoreListModelImpl;

  factory _OnBoardStoreListModel.fromJson(Map<String, dynamic> json) =
      _$OnBoardStoreListModelImpl.fromJson;

  @override
  String? get ID;
  @override
  String? get storeName;
  @override
  String? get userId;
  @override
  String? get storeCategory;
  @override
  String? get storeContactDetails;
  @override
  String? get storeProfilePic;
  @override
  String? get createdAt;
  @override
  bool? get isPlanUpgraded;
  @override
  bool? get isWhiteLabelApp;
  @override
  String? get onboardAuditProcess;
  @override
  String? get whitelabelAuditProcess;
  @override
  @JsonKey(ignore: true)
  _$$OnBoardStoreListModelImplCopyWith<_$OnBoardStoreListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
