import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';
part 'login_response.freezed.dart';

@freezed
abstract class LoginResponse with _$LoginResponse {
  factory LoginResponse({
    String? ID,
    String? refCode,
    String? fullName,
    String? email,
    String? mobile,
    String? profilePic,
    String? frontIDCard,
    String? backIDCard,
    String? visitingCard,
    List<dynamic>? roles,
    String? userId,
    String? token,
    String? data1,
    List<dynamic>? ModulePermissions,
    String? partnerType,
    bool? partnerRegistered,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
