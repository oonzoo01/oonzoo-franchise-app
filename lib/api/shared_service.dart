import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/material.dart';
import 'package:salesapp/login_page.dart';

import '../main.dart';
import '../model/login_response.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    var isCacheKeyExist =
        await APICacheManager().isAPICacheKeyExist("login_details");

    return isCacheKeyExist;
  }

  static Future<LoginResponse?> loginDetails() async {
    var isCacheKeyExist =
        await APICacheManager().isAPICacheKeyExist("login_details");

    if (isCacheKeyExist) {
      var cacheData = await APICacheManager().getCacheData("login_details");

      return LoginResponse.fromJson(jsonDecode(cacheData.syncData));
    }

    return null;
  }

  static Future<LoginResponse?> registerDetails() async {
    var isCacheKeyExist =
        await APICacheManager().isAPICacheKeyExist("register_details");

    if (isCacheKeyExist) {
      var cacheData = await APICacheManager().getCacheData("register_details");

      return LoginResponse.fromJson(jsonDecode(cacheData.syncData));
    }

    return null;
  }

  static Future<void> setRegisterDetails(
    LoginResponse loginResponse,
  ) async {
    APICacheDBModel cacheModel = APICacheDBModel(
      key: "register_details",
      syncData: jsonEncode(loginResponse.toJson()),
    );

    await APICacheManager().addCacheData(cacheModel);
  }

  static Future<LoginResponse?> registerProfileDetails() async {
    var isCacheKeyExist =
        await APICacheManager().isAPICacheKeyExist("register_profile_details");

    if (isCacheKeyExist) {
      var cacheData =
          await APICacheManager().getCacheData("register_profile_details");

      return LoginResponse.fromJson(jsonDecode(cacheData.syncData));
    }

    return null;
  }

  static Future<void> setRegisterProfileDetails(
    LoginResponse loginResponse,
  ) async {
    APICacheDBModel cacheModel = APICacheDBModel(
      key: "register_profile_details",
      syncData: jsonEncode(loginResponse.toJson()),
    );

    await APICacheManager().addCacheData(cacheModel);
  }

  static Future<void> setLoginDetails(
    LoginResponse loginResponse,
  ) async {
    APICacheDBModel cacheModel = APICacheDBModel(
      key: "login_details",
      syncData: jsonEncode(loginResponse.toJson()),
    );

    await APICacheManager().addCacheData(cacheModel);
  }

  static Future<void> logout() async {
    await APICacheManager().deleteCache("login_details");
    APICacheManager().emptyCache();

    navigatorKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const SignInPage()),
      (Route<dynamic> route) => false,
    );
  }

  // static Future<void> forceLogout() async {
  //   await APICacheManager().deleteCache("login_details");

  //   // Provider.of<LoginDetailsProvider>(
  //   //         NavigationService.navigatorKey.currentContext!,
  //   //         listen: false)
  //   //     .userLogout();

  //   navigatorKey.currentState!.pushAndRemoveUntil(
  //     MaterialPageRoute(builder: (context) => const SignInPage()),
  //     (Route<dynamic> route) => false,
  //   );
  // }
}
