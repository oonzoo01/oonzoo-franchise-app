// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_store_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchStoreDetails _$SearchStoreDetailsFromJson(Map<String, dynamic> json) {
  return _SearchStoreDetails.fromJson(json);
}

/// @nodoc
mixin _$SearchStoreDetails {
  String? get storeName => throw _privateConstructorUsedError;
  StoreCategory? get storeCategory => throw _privateConstructorUsedError;
  String? get storeContactDetails => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get storeProfilePic => throw _privateConstructorUsedError;
  String? get ID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchStoreDetailsCopyWith<SearchStoreDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStoreDetailsCopyWith<$Res> {
  factory $SearchStoreDetailsCopyWith(
          SearchStoreDetails value, $Res Function(SearchStoreDetails) then) =
      _$SearchStoreDetailsCopyWithImpl<$Res, SearchStoreDetails>;
  @useResult
  $Res call(
      {String? storeName,
      StoreCategory? storeCategory,
      String? storeContactDetails,
      String? userId,
      String? storeProfilePic,
      String? ID});

  $StoreCategoryCopyWith<$Res>? get storeCategory;
}

/// @nodoc
class _$SearchStoreDetailsCopyWithImpl<$Res, $Val extends SearchStoreDetails>
    implements $SearchStoreDetailsCopyWith<$Res> {
  _$SearchStoreDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeName = freezed,
    Object? storeCategory = freezed,
    Object? storeContactDetails = freezed,
    Object? userId = freezed,
    Object? storeProfilePic = freezed,
    Object? ID = freezed,
  }) {
    return _then(_value.copyWith(
      storeName: freezed == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String?,
      storeCategory: freezed == storeCategory
          ? _value.storeCategory
          : storeCategory // ignore: cast_nullable_to_non_nullable
              as StoreCategory?,
      storeContactDetails: freezed == storeContactDetails
          ? _value.storeContactDetails
          : storeContactDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      storeProfilePic: freezed == storeProfilePic
          ? _value.storeProfilePic
          : storeProfilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      ID: freezed == ID
          ? _value.ID
          : ID // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoreCategoryCopyWith<$Res>? get storeCategory {
    if (_value.storeCategory == null) {
      return null;
    }

    return $StoreCategoryCopyWith<$Res>(_value.storeCategory!, (value) {
      return _then(_value.copyWith(storeCategory: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchStoreDetailsImplCopyWith<$Res>
    implements $SearchStoreDetailsCopyWith<$Res> {
  factory _$$SearchStoreDetailsImplCopyWith(_$SearchStoreDetailsImpl value,
          $Res Function(_$SearchStoreDetailsImpl) then) =
      __$$SearchStoreDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? storeName,
      StoreCategory? storeCategory,
      String? storeContactDetails,
      String? userId,
      String? storeProfilePic,
      String? ID});

  @override
  $StoreCategoryCopyWith<$Res>? get storeCategory;
}

/// @nodoc
class __$$SearchStoreDetailsImplCopyWithImpl<$Res>
    extends _$SearchStoreDetailsCopyWithImpl<$Res, _$SearchStoreDetailsImpl>
    implements _$$SearchStoreDetailsImplCopyWith<$Res> {
  __$$SearchStoreDetailsImplCopyWithImpl(_$SearchStoreDetailsImpl _value,
      $Res Function(_$SearchStoreDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeName = freezed,
    Object? storeCategory = freezed,
    Object? storeContactDetails = freezed,
    Object? userId = freezed,
    Object? storeProfilePic = freezed,
    Object? ID = freezed,
  }) {
    return _then(_$SearchStoreDetailsImpl(
      storeName: freezed == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String?,
      storeCategory: freezed == storeCategory
          ? _value.storeCategory
          : storeCategory // ignore: cast_nullable_to_non_nullable
              as StoreCategory?,
      storeContactDetails: freezed == storeContactDetails
          ? _value.storeContactDetails
          : storeContactDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      storeProfilePic: freezed == storeProfilePic
          ? _value.storeProfilePic
          : storeProfilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      ID: freezed == ID
          ? _value.ID
          : ID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchStoreDetailsImpl implements _SearchStoreDetails {
  const _$SearchStoreDetailsImpl(
      {this.storeName,
      this.storeCategory,
      this.storeContactDetails,
      this.userId,
      this.storeProfilePic,
      this.ID});

  factory _$SearchStoreDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchStoreDetailsImplFromJson(json);

  @override
  final String? storeName;
  @override
  final StoreCategory? storeCategory;
  @override
  final String? storeContactDetails;
  @override
  final String? userId;
  @override
  final String? storeProfilePic;
  @override
  final String? ID;

  @override
  String toString() {
    return 'SearchStoreDetails(storeName: $storeName, storeCategory: $storeCategory, storeContactDetails: $storeContactDetails, userId: $userId, storeProfilePic: $storeProfilePic, ID: $ID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStoreDetailsImpl &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.storeCategory, storeCategory) ||
                other.storeCategory == storeCategory) &&
            (identical(other.storeContactDetails, storeContactDetails) ||
                other.storeContactDetails == storeContactDetails) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.storeProfilePic, storeProfilePic) ||
                other.storeProfilePic == storeProfilePic) &&
            (identical(other.ID, ID) || other.ID == ID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, storeName, storeCategory,
      storeContactDetails, userId, storeProfilePic, ID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStoreDetailsImplCopyWith<_$SearchStoreDetailsImpl> get copyWith =>
      __$$SearchStoreDetailsImplCopyWithImpl<_$SearchStoreDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchStoreDetailsImplToJson(
      this,
    );
  }
}

abstract class _SearchStoreDetails implements SearchStoreDetails {
  const factory _SearchStoreDetails(
      {final String? storeName,
      final StoreCategory? storeCategory,
      final String? storeContactDetails,
      final String? userId,
      final String? storeProfilePic,
      final String? ID}) = _$SearchStoreDetailsImpl;

  factory _SearchStoreDetails.fromJson(Map<String, dynamic> json) =
      _$SearchStoreDetailsImpl.fromJson;

  @override
  String? get storeName;
  @override
  StoreCategory? get storeCategory;
  @override
  String? get storeContactDetails;
  @override
  String? get userId;
  @override
  String? get storeProfilePic;
  @override
  String? get ID;
  @override
  @JsonKey(ignore: true)
  _$$SearchStoreDetailsImplCopyWith<_$SearchStoreDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoreCategory _$StoreCategoryFromJson(Map<String, dynamic> json) {
  return _StoreCategory.fromJson(json);
}

/// @nodoc
mixin _$StoreCategory {
  String? get categoryName => throw _privateConstructorUsedError;
  String? get categoryImage => throw _privateConstructorUsedError;
  String? get ID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreCategoryCopyWith<StoreCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreCategoryCopyWith<$Res> {
  factory $StoreCategoryCopyWith(
          StoreCategory value, $Res Function(StoreCategory) then) =
      _$StoreCategoryCopyWithImpl<$Res, StoreCategory>;
  @useResult
  $Res call({String? categoryName, String? categoryImage, String? ID});
}

/// @nodoc
class _$StoreCategoryCopyWithImpl<$Res, $Val extends StoreCategory>
    implements $StoreCategoryCopyWith<$Res> {
  _$StoreCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = freezed,
    Object? categoryImage = freezed,
    Object? ID = freezed,
  }) {
    return _then(_value.copyWith(
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryImage: freezed == categoryImage
          ? _value.categoryImage
          : categoryImage // ignore: cast_nullable_to_non_nullable
              as String?,
      ID: freezed == ID
          ? _value.ID
          : ID // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreCategoryImplCopyWith<$Res>
    implements $StoreCategoryCopyWith<$Res> {
  factory _$$StoreCategoryImplCopyWith(
          _$StoreCategoryImpl value, $Res Function(_$StoreCategoryImpl) then) =
      __$$StoreCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? categoryName, String? categoryImage, String? ID});
}

/// @nodoc
class __$$StoreCategoryImplCopyWithImpl<$Res>
    extends _$StoreCategoryCopyWithImpl<$Res, _$StoreCategoryImpl>
    implements _$$StoreCategoryImplCopyWith<$Res> {
  __$$StoreCategoryImplCopyWithImpl(
      _$StoreCategoryImpl _value, $Res Function(_$StoreCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = freezed,
    Object? categoryImage = freezed,
    Object? ID = freezed,
  }) {
    return _then(_$StoreCategoryImpl(
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryImage: freezed == categoryImage
          ? _value.categoryImage
          : categoryImage // ignore: cast_nullable_to_non_nullable
              as String?,
      ID: freezed == ID
          ? _value.ID
          : ID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreCategoryImpl implements _StoreCategory {
  const _$StoreCategoryImpl({this.categoryName, this.categoryImage, this.ID});

  factory _$StoreCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreCategoryImplFromJson(json);

  @override
  final String? categoryName;
  @override
  final String? categoryImage;
  @override
  final String? ID;

  @override
  String toString() {
    return 'StoreCategory(categoryName: $categoryName, categoryImage: $categoryImage, ID: $ID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreCategoryImpl &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryImage, categoryImage) ||
                other.categoryImage == categoryImage) &&
            (identical(other.ID, ID) || other.ID == ID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, categoryName, categoryImage, ID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreCategoryImplCopyWith<_$StoreCategoryImpl> get copyWith =>
      __$$StoreCategoryImplCopyWithImpl<_$StoreCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreCategoryImplToJson(
      this,
    );
  }
}

abstract class _StoreCategory implements StoreCategory {
  const factory _StoreCategory(
      {final String? categoryName,
      final String? categoryImage,
      final String? ID}) = _$StoreCategoryImpl;

  factory _StoreCategory.fromJson(Map<String, dynamic> json) =
      _$StoreCategoryImpl.fromJson;

  @override
  String? get categoryName;
  @override
  String? get categoryImage;
  @override
  String? get ID;
  @override
  @JsonKey(ignore: true)
  _$$StoreCategoryImplCopyWith<_$StoreCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
