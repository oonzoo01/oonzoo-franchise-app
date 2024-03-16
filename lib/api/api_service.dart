import 'dart:convert';
import 'dart:developer';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:salesapp/model/franchise_dashboard_model/franchise_dashboard_model.dart';
import 'package:salesapp/model/franchise_insight/franchise_insight.dart';
import 'package:salesapp/model/franchise_member_model/franchise_member_model.dart';
import 'package:salesapp/model/member_all_detils/member_all_details.dart';
import 'package:salesapp/model/on_oboard_store_model/on_oboard_store_model.dart';
import 'package:salesapp/model/profile_model/profile_model.dart';
import 'package:salesapp/model/search_store_details/search_store_details.dart';
import 'package:salesapp/model/wallet_model/wallet_model.dart';
import '../config.dart';
import '../model/login_response.dart';
import '../utils/utils.dart';
import 'shared_service.dart';

class APIService {
  static var client = http.Client();

  /// partner api

  static Future<String?> partnerRegistration(
      String email, String partnerType) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.https(
      Config.apiURL,
      Config.patnerProfileOtpApi,
    );

    try {
      final response = await http.post(
        url,
        headers: requestHeaders,
        body: jsonEncode({
          "email": email,
          "partnerType": "franchise",
        }),
      );

      log(response.body, name: 'register otp res');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['data'];
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> verifyPartnerOtp(
    String email,
    String partnerType,
    String hash,
    String otp,
    String fullName,
    String password,
    String mobile,
  ) async {
    try {
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      var url = Uri.http(
        Config.apiURL,
        Config.patnerVerifyApi,
      );

      final response = await http.post(
        url,
        headers: requestHeaders,
        body: jsonEncode(
          {
            "email": email,
            "partnerType": "franchise",
            "hash": hash,
            "otp": otp,
            "fullName": fullName,
            "password": password,
            "mobile": mobile,
          },
        ),
      );

      log('$url');
      log(response.body, name: 'resgister response');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        var loginResponse = LoginResponse.fromJson(data["data"]);
        log(loginResponse.toString());
        await SharedService.setRegisterDetails(
          loginResponse,
        );

        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> partnerLogin(
    String email,
    String password,
    String partnerType,
    String? refCode,
  ) async {
    final loginDetails = await SharedService.registerDetails();
    // log(loginDetails.toString());
    try {
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      var url = Uri.http(
        Config.apiURL,
        Config.patnerLoginApi,
      );

      log(url.toString());

      var response = await http.post(
        url,
        headers: requestHeaders,
        body: jsonEncode(
          {
            "email": email,
            "password": password,
            "partnerType": "franchise",
            "refCode": refCode ?? loginDetails?.refCode ?? '',
          },
        ),
      );

      log(response.body, name: 'partner res');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        var loginResponse = LoginResponse.fromJson(data["data"]);

        await SharedService.setLoginDetails(
          loginResponse,
        );

        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<String?> partnerProfileRegistration(
    String workCountry,
    String nationality,
    String proofID,
    String proofIDNo,
    String dateofBirth,
    String? proofIDFrontImage,
    String? proofIDBackImage,
    String? drivingLicenseFrontImage,
    String? drivingLicenseBackImage,
    String? profilePic,
    String? refCode,
  ) async {
    try {
      final loginDetails = await SharedService.loginDetails();
      final regiDetails = await SharedService.registerDetails();
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      log(loginDetails.toString());

      var url = Uri.https(
        Config.apiURL,
        Config.patnerRegisterApi,
      );

      var request = http.MultipartRequest("POST", url);

      request.headers.addAll(requestHeaders);
      request.fields['userId'] = regiDetails?.ID ?? loginDetails?.ID ?? '';
      request.fields['workCountry'] = workCountry;
      request.fields['nationality'] = nationality;
      request.fields['proofID'] = proofID.toUpperCase();
      request.fields['proofIDNo'] = proofIDNo;
      request.fields['dateofBirth'] = dateofBirth;
      request.fields['franchiseRefCode'] = refCode ?? '';

      // proof id front image
      if (proofIDFrontImage != null || proofIDFrontImage != '') {
        http.MultipartFile selectedProofIDFrontImage =
            await http.MultipartFile.fromPath(
          'proofIDFrontImage',
          proofIDFrontImage!,
        );

        request.files.add(selectedProofIDFrontImage);
      }

      // proof id back image
      if (proofIDBackImage != null || proofIDBackImage != '') {
        http.MultipartFile selectedProofIDBackImage =
            await http.MultipartFile.fromPath(
          'proofIDBackImage',
          proofIDBackImage!,
        );

        request.files.add(selectedProofIDBackImage);
      }

      // driving license front image
      if (drivingLicenseFrontImage != null || drivingLicenseFrontImage != '') {
        http.MultipartFile selectedDrivingLicenseFrontImage =
            await http.MultipartFile.fromPath(
          'drivingLicenseFrontImage',
          drivingLicenseFrontImage!,
        );

        request.files.add(selectedDrivingLicenseFrontImage);
      }

      // driving license back image
      if (drivingLicenseBackImage != null || drivingLicenseBackImage != '') {
        http.MultipartFile selectedDrivingLicenseBackImage =
            await http.MultipartFile.fromPath(
          'drivingLicenseBackImage',
          drivingLicenseBackImage!,
        );

        request.files.add(selectedDrivingLicenseBackImage);
      }

      // profile pic
      if (profilePic != null || profilePic != '') {
        http.MultipartFile selectedProfilePic =
            await http.MultipartFile.fromPath(
          'profilePic',
          profilePic!,
        );

        request.files.add(selectedProfilePic);
      }

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      log(response.body, name: 'profile resgistration');
      // log(response.statusCode.toString());

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        var loginResponse = LoginResponse.fromJson(data["data"]);

        await SharedService.setRegisterProfileDetails(
          loginResponse,
        );
        return data['message'];
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString(), name: 'error');
      return null;
    }
  }

  static Future<List<SearchStoreDetails>?> searchNonWhiteLabelStore(
      String storeName, String createdOn, customDates,
      {String? whitelabelStatus}) async {
    try {
      var loginDetails = await SharedService.loginDetails();
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${loginDetails!.token.toString()}'
      };

      Map<String, String> queryString = {
        'storeName': storeName,
        'whitelabelStatus': whitelabelStatus ?? '',
        'createdOn': createdOn,
        'startDate':
            customDates.length > 0 ? Utils.formatDateOnly(customDates[0]) : '',
        'endDate':
            customDates.length > 0 ? Utils.formatDateOnly(customDates[1]) : '',
      };
      var url = Uri.http(
        Config.apiURL,
        Config.partnerNonWhitelabelSearch,
        queryString,
      );
      // log("${loginDetails.token}\n$url");
      final respose = await http.get(
        url,
        headers: requestHeaders,
      );

      if (respose.statusCode == 200) {
        final data = jsonDecode(respose.body);
        return SearchStoreDetails.fromList(data['data']);
      } else if (respose.statusCode == 401) {
        SharedService.logout();
        return null;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString(), name: 'non white label search error');
      return null;
    }
  }

  static Future<String?> registerStoreAsWhitelabel(storeId) async {
    try {
      var loginDetails = await SharedService.loginDetails();
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${loginDetails!.token.toString()}'
      };
      var url = Uri.http(
        Config.apiURL,
        Config.partnerRegisterStore,
      );

      final respose = await http.post(
        url,
        headers: requestHeaders,
        body: jsonEncode(
          {
            "storeId": storeId,
          },
        ),
      );

      if (respose.statusCode == 200) {
        final data = jsonDecode(respose.body);
        return data['message'];
      } else if (respose.statusCode == 401) {
        SharedService.logout();
        return null;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString(), name: 'register Store As Whitelabel error');
      return null;
    }
  }

  static Future<FranchiseModel?> getAllFranchiseMember(
    page,
    pageNumber,
  ) async {
    try {
      var loginDetails = await SharedService.loginDetails();
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${loginDetails!.token.toString()}'
      };

      log(loginDetails.token.toString());
      Map<String, String> queryString = {
        'page': page,
        'pageSize': pageNumber,
      };

      var url = Uri.http(
        Config.apiURL,
        Config.partnerFranchiseAllMemberList,
        queryString,
      );
      log(url.toString(), name: 'franchise');
      final respose = await http.get(
        url,
        headers: requestHeaders,
      );
      // log(respose.body, name: 'getAllFranchiseMember');
      // log(respose.statusCode.toString());
      if (respose.statusCode == 200) {
        final data = jsonDecode(respose.body);
        return FranchiseModel.fromJson(data);
      } else if (respose.statusCode == 401) {
        SharedService.logout();
        return null;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString(), name: 'getAllFranchiseMember error');
      return null;
    }
  }

  static Future<String?> addActiveMember(userId) async {
    try {
      var loginDetails = await SharedService.loginDetails();
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${loginDetails!.token.toString()}'
      };

      var url = Uri.http(
        Config.apiURL,
        Config.partnerFranchiseActiveApi,
      );

      final respose = await http.post(
        url,
        headers: requestHeaders,
        body: jsonEncode({
          "userId": userId,
        }),
      );

      // log(respose.body, name: 'acitve member');
      if (respose.statusCode == 200) {
        final data = jsonDecode(respose.body);
        return data['message'];
      } else if (respose.statusCode == 401) {
        SharedService.logout();
        return null;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString(), name: 'addActiveMember error');
      return null;
    }
  }

  static Future<String?> dctiveMember(userId) async {
    try {
      var loginDetails = await SharedService.loginDetails();
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${loginDetails!.token.toString()}'
      };

      var url = Uri.http(
        Config.apiURL,
        Config.partnerFranchiseDeactiveApi,
      );

      final respose = await http.post(
        url,
        headers: requestHeaders,
        body: jsonEncode({
          "userId": userId,
        }),
      );
      log(respose.body, name: 'dctive member');
      if (respose.statusCode == 200) {
        final data = jsonDecode(respose.body);
        return data['message'];
      } else if (respose.statusCode == 401) {
        SharedService.logout();
        return null;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString(), name: 'dctiveMember error');
      return null;
    }
  }

  static Future<String?> partnerChangePassword(
    String password,
    String newPassword,
  ) async {
    try {
      var loginDetails = await SharedService.loginDetails();
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${loginDetails!.token.toString()}'
      };

      var url = Uri.http(
        Config.apiURL,
        Config.partnerChangePasswordApi,
      );

      final respose = await http.post(
        url,
        headers: requestHeaders,
        body: jsonEncode({
          "password": password,
          "newPassword": newPassword,
        }),
      );

      if (respose.statusCode == 200) {
        final data = jsonDecode(respose.body);
        final res = data['data'];
        return res['message'];
      } else if (respose.statusCode == 401) {
        SharedService.logout();
        return null;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString(), name: 'partnerChangePassword error');
      return null;
    }
  }

  static Future<OnBoardstoreModel?> getFreelancerOnboardStore(
      String page, String pageSize, String createdOn, customDates,
      {String? whitelabelStatus}) async {
    try {
      var loginDetails = await SharedService.loginDetails();
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${loginDetails!.token.toString()}'
      };

      Map<String, String> queryString = {
        'whitelabelStatus': whitelabelStatus ?? '',
        'page': page,
        'pageSize': pageSize,
        'createdOn': createdOn,
        'startDate':
            customDates.length > 0 ? Utils.formatDateOnly(customDates[0]) : '',
        'endDate':
            customDates.length > 0 ? Utils.formatDateOnly(customDates[1]) : '',
      };

      var url = Uri.http(
        Config.apiURL,
        Config.freelancerOnboardStoresApi,
        queryString,
      );

      log("${loginDetails.token}\n$url");
      final respose = await http.get(
        url,
        headers: requestHeaders,
      );
      // log(respose.body, name: 'getFreelancerOnboardStore');
      if (respose.statusCode == 200) {
        final data = jsonDecode(respose.body);
        return OnBoardstoreModel.fromJson(data);
      } else if (respose.statusCode == 401) {
        SharedService.logout();
        return null;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString(), name: 'getFreelancerOnboardStore error');
      return null;
    }
  }

  static Future<ProfileModel?> getProfileData() async {
    try {
      var loginDetails = await SharedService.loginDetails();
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${loginDetails!.token.toString()}'
      };

      var url = Uri.http(
        Config.apiURL,
        Config.partnerProfileApi,
      );

      final respose = await http.get(
        url,
        headers: requestHeaders,
      );

      // log(respose.body, name: 'getprofile data');
      // log(respose.statusCode.toString());
      if (respose.statusCode == 200) {
        final data = jsonDecode(respose.body);
        return ProfileModel.fromJson(data['data']);
      } else if (respose.statusCode == 401) {
        SharedService.logout();
        return null;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString(), name: 'getProfileData error');
      return null;
    }
  }

  static Future<MemberAllDetailsModel?> fetchFreelancerDetails(
      String id) async {
    try {
      var loginDetails = await SharedService.loginDetails();
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${loginDetails!.token.toString()}'
      };
      // log(loginDetails.token.toString());
      var url = Uri.http(
        Config.apiURL,
        "${Config.freelancerAllDetailsApi}/$id",
      );
      // log(url.toString());
      final respose = await http.get(
        url,
        headers: requestHeaders,
      );
      // log(respose.body);
      if (respose.statusCode == 200) {
        final data = jsonDecode(respose.body);
        return MemberAllDetailsModel.fromJson(data['data']);
      } else if (respose.statusCode == 401) {
        SharedService.logout();
        return null;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString(), name: 'fetchFreelancerDetails error');
      return null;
    }
  }

  static Future<MemberAllDetailsModel?> updatedMemberDetails(
    String userId,
    String partnerId,
    String fullName,
    String mobile,
    String email,
    String selectedWorld,
    String nationality,
    String proofIdType,
    String proofIDNo,
    String age,
    String dateofBirth,
    String? proofIDFrontImage,
    String? proofIDBackImage,
    String? drivingLicenseFrontImage,
    String? drivingLicenseBackImage,
    String? profilePic,
  ) async {
    try {
      var loginDetails = await SharedService.loginDetails();
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${loginDetails!.token.toString()}'
      };
      log(loginDetails.token.toString());
      var url = Uri.http(
        Config.apiURL,
        Config.editMemberDetailsApi,
      );

      var request = http.MultipartRequest("POST", url);

      request.headers.addAll(requestHeaders);
      request.fields['userId'] = userId;
      request.fields['partnerId'] = partnerId;
      request.fields['fullName'] = fullName;
      request.fields['mobile'] = mobile;
      request.fields['email'] = email;
      request.fields['workCountry'] = selectedWorld;
      request.fields['nationality'] = nationality;
      request.fields['proofID'] = proofIdType.toUpperCase();
      request.fields['proofIDNo'] = proofIDNo;
      request.fields['age'] = age;
      request.fields['dateofBirth'] = dateofBirth;
      // request.fields['franchiseRefCode'] = refCode ?? '';

      // proof id front image
      if (proofIDFrontImage != null && proofIDFrontImage != '') {
        http.MultipartFile selectedProofIDFrontImage =
            await http.MultipartFile.fromPath(
          'proofIDFrontImage',
          proofIDFrontImage,
        );

        request.files.add(selectedProofIDFrontImage);
      }

      // proof id back image
      if (proofIDBackImage != null && proofIDBackImage != '') {
        http.MultipartFile selectedProofIDBackImage =
            await http.MultipartFile.fromPath(
          'proofIDBackImage',
          proofIDBackImage,
        );

        request.files.add(selectedProofIDBackImage);
      }

      // driving license front image
      if (drivingLicenseFrontImage != null && drivingLicenseFrontImage != '') {
        http.MultipartFile selectedDrivingLicenseFrontImage =
            await http.MultipartFile.fromPath(
          'drivingLicenseFrontImage',
          drivingLicenseFrontImage,
        );

        request.files.add(selectedDrivingLicenseFrontImage);
      }

      // driving license back image
      if (drivingLicenseBackImage != null && drivingLicenseBackImage != '') {
        http.MultipartFile selectedDrivingLicenseBackImage =
            await http.MultipartFile.fromPath(
          'drivingLicenseBackImage',
          drivingLicenseBackImage,
        );

        request.files.add(selectedDrivingLicenseBackImage);
      }

      // profile pic
      if (profilePic != null && profilePic != "") {
        log(profilePic.toString());
        log('profile pic');
        http.MultipartFile selectedProfilePic =
            await http.MultipartFile.fromPath(
          'profilePic',
          profilePic,
        );
        request.files.add(selectedProfilePic);
      }
      // log(url.toString());
      // log(request.files.toString());
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      // log(response.body, name: 'updated response');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return MemberAllDetailsModel.fromJson(data['data']);
      } else if (response.statusCode == 401) {
        SharedService.logout();
        return null;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString(), name: 'updatedMemberDetails error');
      return null;
    }
  }

  static Future<String?> restPasswordOtp(
    String email,
    // String partnerType,
  ) async {
    try {
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      var url = Uri.http(
        Config.apiURL,
        Config.restPasswordOtpApi,
      );

      final response = await http.post(
        url,
        headers: requestHeaders,
        body: jsonEncode({
          "email": email,
          "partnerType": "franchise",
        }),
      );
      log(response.body, name: 'rest pass otp');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['data'];
      } else if (response.statusCode == 401) {
        SharedService.logout();
        return null;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString(), name: 'restPasswordOtp error');
      return null;
    }
  }

  static Future<String?> restPasswordVerify(
    String email,
    String partnerType,
    String hashCode,
    String otp,
    String password,
  ) async {
    try {
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      var url = Uri.http(
        Config.apiURL,
        Config.restPasswordApi,
      );
      // log("$email \n$partnerType \n$hashCode \n$otp \n$password");
      // log(url.toString());
      final response = await http.post(
        url,
        headers: requestHeaders,
        body: jsonEncode({
          "email": email,
          "partnerType": "franchise",
          "hash": hashCode,
          "otp": otp,
          "password": password,
        }),
      );
      // log(response.statusCode.toString());
      // log(response.body, name: 'response verify');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['message'];
      } else if (response.statusCode == 401) {
        SharedService.logout();
        return null;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString(), name: 'restPasswordVerify error');
      return null;
    }
  }

  static Future<OnBoardstoreModel?> getFranchiseOnboardStore(
      page, pageSize, String createdOn, customDates, String freelancerId,
      {String? whitelabelStatus}) async {
    try {
      var loginDetails = await SharedService.loginDetails();
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${loginDetails!.token.toString()}'
      };

      Map<String, String> queryString = {
        'pageSize': pageSize,
        'page': page,
        'whitelabelStatus': whitelabelStatus ?? '',
        'createdOn': createdOn,
        'startDate':
            customDates.length > 0 ? Utils.formatDateOnly(customDates[0]) : '',
        'endDate':
            customDates.length > 0 ? Utils.formatDateOnly(customDates[1]) : '',
      };

      if (freelancerId != '') {
        queryString['freelancerId'] = freelancerId;
      }

      var url = Uri.http(
        Config.apiURL,
        Config.franchiseOnboardStoreApi,
        queryString,
      );
      // log(url.toString());
      final response = await http.get(
        url,
        headers: requestHeaders,
      );
      // log(url.toString());
      // log(response.body, name: 'getFranchiseOnboardStore');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return OnBoardstoreModel.fromJson(data);
      } else if (response.statusCode == 401) {
        SharedService.logout();
        return null;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString(), name: 'getFranchiseOnboardStore error');
      return null;
    }
  }

  static Future<WalletModel?> getWalletTransactionHistory(
      page, pageSize) async {
    try {
      var loginDetails = await SharedService.loginDetails();
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${loginDetails!.token.toString()}'
      };

      Map<String, String> queryString = {
        'pageSize': pageSize,
        'page': page,
      };

      var url = Uri.http(
        Config.apiURL,
        Config.walletTransactionApi,
        queryString,
      );

      final response = await http.get(
        url,
        headers: requestHeaders,
      );
      // log("$url\n${loginDetails.token}");
      // log(response.body, name: 'getWalletTransactionHistory');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return WalletModel.fromJson(data);
      } else if (response.statusCode == 401) {
        SharedService.logout();
        return null;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString(), name: 'getWalletTransactionHistory error');
      return null;
    }
  }

  static Future<FranchiseDashboardModel?> getFranchiseDashboard() async {
    try {
      var loginDetails = await SharedService.loginDetails();
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${loginDetails!.token.toString()}'
      };

      // Map<String, String> queryString = {
      //   'pageSize': pageSize,
      //   'page': page,
      // };

      var url = Uri.http(
        Config.apiURL,
        Config.franchiseDashboardApi,
        // queryString,
      );

      final response = await http.get(
        url,
        headers: requestHeaders,
      );
      // log("$url\n${loginDetails.token}");
      // log(response.body, name: 'getFranchiseDashboard');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return FranchiseDashboardModel.fromJson(data);
      } else if (response.statusCode == 401) {
        SharedService.logout();
        return null;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString(), name: 'getFranchiseDashboard error');
      return null;
    }
  }

  static Future<FranchiseInsightModel?> getFranchiseInsight(
      String createdOn) async {
    try {
      var loginDetails = await SharedService.loginDetails();
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${loginDetails!.token.toString()}'
      };

      Map<String, String> queryString = {
        'createdOn': createdOn,
      };

      var url = Uri.http(
        Config.apiURL,
        Config.freelancerDashboardApi,
        queryString,
      );
      // log("$url\n${loginDetails.token}");
      final response = await http.get(
        url,
        headers: requestHeaders,
      );

      log(response.body, name: 'getFranchiseInsight');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return FranchiseInsightModel.fromJson(data);
      } else if (response.statusCode == 401) {
        SharedService.logout();
        return null;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString(), name: 'getFranchiseInsight error');
      return null;
    }
  }

  static Future<String?> addAuditRequest(String storeId) async {
    try {
      var loginDetails = await SharedService.loginDetails();
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${loginDetails!.token.toString()}'
      };

      var url = Uri.http(
        Config.apiURL,
        Config.freelancerAuditRequestApi,
      );
      // log("$url\n${loginDetails.token}");
      final response = await http.post(
        url,
        headers: requestHeaders,
        body: jsonEncode(
          {
            "storeId": storeId,
          },
        ),
      );

      log(response.body, name: 'addAuditRequest');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["message"];
      } else if (response.statusCode == 401) {
        SharedService.logout();
        return null;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString(), name: 'addAuditRequest error');
      return null;
    }
  }
}
