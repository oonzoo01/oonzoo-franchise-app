import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_store_details.freezed.dart';
part 'search_store_details.g.dart';

@freezed
class SearchStoreDetails with _$SearchStoreDetails {
  const factory SearchStoreDetails({
    String? storeName,
    StoreCategory? storeCategory,
    String? storeContactDetails,
    String? userId,
    String? storeProfilePic,
    String? ID,
  }) = _SearchStoreDetails;

  factory SearchStoreDetails.fromJson(Map<String, dynamic> json) =>
      _$SearchStoreDetailsFromJson(json);

  static List<SearchStoreDetails> fromList(dynamic json) {
    List<SearchStoreDetails> list = [];
    if (json != null && json is List) {
      for (var item in json) {
        list.add(SearchStoreDetails.fromJson(item));
      }
    }

    return list;
  }
}

@freezed
class StoreCategory with _$StoreCategory {
  const factory StoreCategory({
    String? categoryName,
    String? categoryImage,
    String? ID,
  }) = _StoreCategory;

  factory StoreCategory.fromJson(Map<String, dynamic> json) =>
      _$StoreCategoryFromJson(json);
}
