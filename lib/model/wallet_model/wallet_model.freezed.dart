// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WalletModel _$WalletModelFromJson(Map<String, dynamic> json) {
  return _WalletModel.fromJson(json);
}

/// @nodoc
mixin _$WalletModel {
  int? get total => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  int? get pageSize => throw _privateConstructorUsedError;
  int? get result => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<WalletDataModel>? get data => throw _privateConstructorUsedError;
  double? get walletBalance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletModelCopyWith<WalletModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletModelCopyWith<$Res> {
  factory $WalletModelCopyWith(
          WalletModel value, $Res Function(WalletModel) then) =
      _$WalletModelCopyWithImpl<$Res, WalletModel>;
  @useResult
  $Res call(
      {int? total,
      int? page,
      int? pageSize,
      int? result,
      String? message,
      List<WalletDataModel>? data,
      double? walletBalance});
}

/// @nodoc
class _$WalletModelCopyWithImpl<$Res, $Val extends WalletModel>
    implements $WalletModelCopyWith<$Res> {
  _$WalletModelCopyWithImpl(this._value, this._then);

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
    Object? walletBalance = freezed,
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
              as List<WalletDataModel>?,
      walletBalance: freezed == walletBalance
          ? _value.walletBalance
          : walletBalance // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletModelImplCopyWith<$Res>
    implements $WalletModelCopyWith<$Res> {
  factory _$$WalletModelImplCopyWith(
          _$WalletModelImpl value, $Res Function(_$WalletModelImpl) then) =
      __$$WalletModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? total,
      int? page,
      int? pageSize,
      int? result,
      String? message,
      List<WalletDataModel>? data,
      double? walletBalance});
}

/// @nodoc
class __$$WalletModelImplCopyWithImpl<$Res>
    extends _$WalletModelCopyWithImpl<$Res, _$WalletModelImpl>
    implements _$$WalletModelImplCopyWith<$Res> {
  __$$WalletModelImplCopyWithImpl(
      _$WalletModelImpl _value, $Res Function(_$WalletModelImpl) _then)
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
    Object? walletBalance = freezed,
  }) {
    return _then(_$WalletModelImpl(
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
              as List<WalletDataModel>?,
      walletBalance: freezed == walletBalance
          ? _value.walletBalance
          : walletBalance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletModelImpl implements _WalletModel {
  const _$WalletModelImpl(
      {this.total,
      this.page,
      this.pageSize,
      this.result,
      this.message,
      final List<WalletDataModel>? data,
      this.walletBalance})
      : _data = data;

  factory _$WalletModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletModelImplFromJson(json);

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
  final List<WalletDataModel>? _data;
  @override
  List<WalletDataModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? walletBalance;

  @override
  String toString() {
    return 'WalletModel(total: $total, page: $page, pageSize: $pageSize, result: $result, message: $message, data: $data, walletBalance: $walletBalance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletModelImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.walletBalance, walletBalance) ||
                other.walletBalance == walletBalance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total, page, pageSize, result,
      message, const DeepCollectionEquality().hash(_data), walletBalance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletModelImplCopyWith<_$WalletModelImpl> get copyWith =>
      __$$WalletModelImplCopyWithImpl<_$WalletModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletModelImplToJson(
      this,
    );
  }
}

abstract class _WalletModel implements WalletModel {
  const factory _WalletModel(
      {final int? total,
      final int? page,
      final int? pageSize,
      final int? result,
      final String? message,
      final List<WalletDataModel>? data,
      final double? walletBalance}) = _$WalletModelImpl;

  factory _WalletModel.fromJson(Map<String, dynamic> json) =
      _$WalletModelImpl.fromJson;

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
  List<WalletDataModel>? get data;
  @override
  double? get walletBalance;
  @override
  @JsonKey(ignore: true)
  _$$WalletModelImplCopyWith<_$WalletModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WalletDataModel _$WalletDataModelFromJson(Map<String, dynamic> json) {
  return _WalletDataModel.fromJson(json);
}

/// @nodoc
mixin _$WalletDataModel {
  String? get ID => throw _privateConstructorUsedError;
  String? get storeName => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get salesType => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  String? get transactionType => throw _privateConstructorUsedError;
  String? get referenceNo => throw _privateConstructorUsedError;
  DateTime? get transactionDate => throw _privateConstructorUsedError;
  bool? get isPaymentApproved => throw _privateConstructorUsedError;
  String? get auditProcess => throw _privateConstructorUsedError;
  String? get auditRemarks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletDataModelCopyWith<WalletDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletDataModelCopyWith<$Res> {
  factory $WalletDataModelCopyWith(
          WalletDataModel value, $Res Function(WalletDataModel) then) =
      _$WalletDataModelCopyWithImpl<$Res, WalletDataModel>;
  @useResult
  $Res call(
      {String? ID,
      String? storeName,
      String? userId,
      String? salesType,
      double? amount,
      String? transactionType,
      String? referenceNo,
      DateTime? transactionDate,
      bool? isPaymentApproved,
      String? auditProcess,
      String? auditRemarks});
}

/// @nodoc
class _$WalletDataModelCopyWithImpl<$Res, $Val extends WalletDataModel>
    implements $WalletDataModelCopyWith<$Res> {
  _$WalletDataModelCopyWithImpl(this._value, this._then);

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
    Object? salesType = freezed,
    Object? amount = freezed,
    Object? transactionType = freezed,
    Object? referenceNo = freezed,
    Object? transactionDate = freezed,
    Object? isPaymentApproved = freezed,
    Object? auditProcess = freezed,
    Object? auditRemarks = freezed,
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
      salesType: freezed == salesType
          ? _value.salesType
          : salesType // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionDate: freezed == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPaymentApproved: freezed == isPaymentApproved
          ? _value.isPaymentApproved
          : isPaymentApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      auditProcess: freezed == auditProcess
          ? _value.auditProcess
          : auditProcess // ignore: cast_nullable_to_non_nullable
              as String?,
      auditRemarks: freezed == auditRemarks
          ? _value.auditRemarks
          : auditRemarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletDataModelImplCopyWith<$Res>
    implements $WalletDataModelCopyWith<$Res> {
  factory _$$WalletDataModelImplCopyWith(_$WalletDataModelImpl value,
          $Res Function(_$WalletDataModelImpl) then) =
      __$$WalletDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? ID,
      String? storeName,
      String? userId,
      String? salesType,
      double? amount,
      String? transactionType,
      String? referenceNo,
      DateTime? transactionDate,
      bool? isPaymentApproved,
      String? auditProcess,
      String? auditRemarks});
}

/// @nodoc
class __$$WalletDataModelImplCopyWithImpl<$Res>
    extends _$WalletDataModelCopyWithImpl<$Res, _$WalletDataModelImpl>
    implements _$$WalletDataModelImplCopyWith<$Res> {
  __$$WalletDataModelImplCopyWithImpl(
      _$WalletDataModelImpl _value, $Res Function(_$WalletDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ID = freezed,
    Object? storeName = freezed,
    Object? userId = freezed,
    Object? salesType = freezed,
    Object? amount = freezed,
    Object? transactionType = freezed,
    Object? referenceNo = freezed,
    Object? transactionDate = freezed,
    Object? isPaymentApproved = freezed,
    Object? auditProcess = freezed,
    Object? auditRemarks = freezed,
  }) {
    return _then(_$WalletDataModelImpl(
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
      salesType: freezed == salesType
          ? _value.salesType
          : salesType // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionDate: freezed == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPaymentApproved: freezed == isPaymentApproved
          ? _value.isPaymentApproved
          : isPaymentApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      auditProcess: freezed == auditProcess
          ? _value.auditProcess
          : auditProcess // ignore: cast_nullable_to_non_nullable
              as String?,
      auditRemarks: freezed == auditRemarks
          ? _value.auditRemarks
          : auditRemarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletDataModelImpl implements _WalletDataModel {
  const _$WalletDataModelImpl(
      {this.ID,
      this.storeName,
      this.userId,
      this.salesType,
      this.amount,
      this.transactionType,
      this.referenceNo,
      this.transactionDate,
      this.isPaymentApproved,
      this.auditProcess,
      this.auditRemarks});

  factory _$WalletDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletDataModelImplFromJson(json);

  @override
  final String? ID;
  @override
  final String? storeName;
  @override
  final String? userId;
  @override
  final String? salesType;
  @override
  final double? amount;
  @override
  final String? transactionType;
  @override
  final String? referenceNo;
  @override
  final DateTime? transactionDate;
  @override
  final bool? isPaymentApproved;
  @override
  final String? auditProcess;
  @override
  final String? auditRemarks;

  @override
  String toString() {
    return 'WalletDataModel(ID: $ID, storeName: $storeName, userId: $userId, salesType: $salesType, amount: $amount, transactionType: $transactionType, referenceNo: $referenceNo, transactionDate: $transactionDate, isPaymentApproved: $isPaymentApproved, auditProcess: $auditProcess, auditRemarks: $auditRemarks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletDataModelImpl &&
            (identical(other.ID, ID) || other.ID == ID) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.salesType, salesType) ||
                other.salesType == salesType) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.referenceNo, referenceNo) ||
                other.referenceNo == referenceNo) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.isPaymentApproved, isPaymentApproved) ||
                other.isPaymentApproved == isPaymentApproved) &&
            (identical(other.auditProcess, auditProcess) ||
                other.auditProcess == auditProcess) &&
            (identical(other.auditRemarks, auditRemarks) ||
                other.auditRemarks == auditRemarks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      ID,
      storeName,
      userId,
      salesType,
      amount,
      transactionType,
      referenceNo,
      transactionDate,
      isPaymentApproved,
      auditProcess,
      auditRemarks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletDataModelImplCopyWith<_$WalletDataModelImpl> get copyWith =>
      __$$WalletDataModelImplCopyWithImpl<_$WalletDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletDataModelImplToJson(
      this,
    );
  }
}

abstract class _WalletDataModel implements WalletDataModel {
  const factory _WalletDataModel(
      {final String? ID,
      final String? storeName,
      final String? userId,
      final String? salesType,
      final double? amount,
      final String? transactionType,
      final String? referenceNo,
      final DateTime? transactionDate,
      final bool? isPaymentApproved,
      final String? auditProcess,
      final String? auditRemarks}) = _$WalletDataModelImpl;

  factory _WalletDataModel.fromJson(Map<String, dynamic> json) =
      _$WalletDataModelImpl.fromJson;

  @override
  String? get ID;
  @override
  String? get storeName;
  @override
  String? get userId;
  @override
  String? get salesType;
  @override
  double? get amount;
  @override
  String? get transactionType;
  @override
  String? get referenceNo;
  @override
  DateTime? get transactionDate;
  @override
  bool? get isPaymentApproved;
  @override
  String? get auditProcess;
  @override
  String? get auditRemarks;
  @override
  @JsonKey(ignore: true)
  _$$WalletDataModelImplCopyWith<_$WalletDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
