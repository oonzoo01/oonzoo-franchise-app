// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchStoreDetailsImpl _$$SearchStoreDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchStoreDetailsImpl(
      storeName: json['storeName'] as String?,
      storeCategory: json['storeCategory'] == null
          ? null
          : StoreCategory.fromJson(
              json['storeCategory'] as Map<String, dynamic>),
      storeContactDetails: json['storeContactDetails'] as String?,
      userId: json['userId'] as String?,
      storeProfilePic: json['storeProfilePic'] as String?,
      ID: json['ID'] as String?,
    );

Map<String, dynamic> _$$SearchStoreDetailsImplToJson(
        _$SearchStoreDetailsImpl instance) =>
    <String, dynamic>{
      'storeName': instance.storeName,
      'storeCategory': instance.storeCategory,
      'storeContactDetails': instance.storeContactDetails,
      'userId': instance.userId,
      'storeProfilePic': instance.storeProfilePic,
      'ID': instance.ID,
    };

_$StoreCategoryImpl _$$StoreCategoryImplFromJson(Map<String, dynamic> json) =>
    _$StoreCategoryImpl(
      categoryName: json['categoryName'] as String?,
      categoryImage: json['categoryImage'] as String?,
      ID: json['ID'] as String?,
    );

Map<String, dynamic> _$$StoreCategoryImplToJson(_$StoreCategoryImpl instance) =>
    <String, dynamic>{
      'categoryName': instance.categoryName,
      'categoryImage': instance.categoryImage,
      'ID': instance.ID,
    };
