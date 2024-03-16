import 'package:freezed_annotation/freezed_annotation.dart';
part 'on_oboard_store_model.freezed.dart';
part 'on_oboard_store_model.g.dart';

@freezed
class OnBoardstoreModel with _$OnBoardstoreModel {
  const factory OnBoardstoreModel({
    int? total,
    int? page,
    int? pageSize,
    int? result,
    String? message,
    List<OnBoardStoreListModel>? data,
  }) = _OnBoardstoreModel;

  factory OnBoardstoreModel.fromJson(Map<String, dynamic> json) =>
      _$OnBoardstoreModelFromJson(json);
}

@freezed
class OnBoardStoreListModel with _$OnBoardStoreListModel {
  const factory OnBoardStoreListModel({
    String? ID,
    String? storeName,
    String? userId,
    String? storeCategory,
    String? storeContactDetails,
    String? storeProfilePic,
    String? createdAt,
    bool? isPlanUpgraded,
    bool? isWhiteLabelApp,
    String? onboardAuditProcess,
    String? whitelabelAuditProcess,
  }) = _OnBoardStoreListModel;

  factory OnBoardStoreListModel.fromJson(Map<String, dynamic> json) =>
      _$OnBoardStoreListModelFromJson(json);

  static List<OnBoardStoreListModel> fromList(dynamic json) {
    List<OnBoardStoreListModel> list = [];
    if (json != null && json is List) {
      for (var item in json) {
        list.add(OnBoardStoreListModel.fromJson(item));
      }
    }

    return list;
  }
}
