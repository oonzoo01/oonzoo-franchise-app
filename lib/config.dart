class Config {
  static String currency = "₹";
  static const String appName = "Store Desk";
  //static const String apiURL = '127.0.0.1:4000'; //PROD_URL
  //static const String apiURL = '192.168.1.15:4000'; //PROD_URL
  // static const String apiURL =
  //     '32h8k4h6yl.execute-api.eu-central-1.amazonaws.com'; //PROD_URL

  ///static const String apiIPURL = "13.126.191.83:4000";

  // static const String apiURL = 'dev.api.icoo.in'; // TestingBaseUrl
  static const String apiURL = 'api.icoo.in'; // BaseUrl

  //static const apiEndpoint = "/dev/api";
  static const apiEndpoint = "/api";

  // parter app api
  static const patnerProfileOtpApi =
      "$apiEndpoint/partner/register-otp"; // done
  static const patnerVerifyApi = "$apiEndpoint/partner/verify-otp"; // done
  static const patnerLoginApi = "$apiEndpoint/partner/login"; // done
  static const patnerRegisterApi =
      "$apiEndpoint/partner/register-profile"; // done
  static const partnerNonWhitelabelSearch =
      "$apiEndpoint/partner/nonwhitelabel-stores"; // done
  static const partnerRegisterStore =
      "$apiEndpoint/partner/register-store-whitelabel"; // done
  static const partnerFranchiseAllMemberList =
      "$apiEndpoint/partner/franchise-team"; // done
  static const partnerFranchiseActiveApi =
      "$apiEndpoint/partner/franchise-activate-member"; // done
  static const partnerFranchiseDeactiveApi =
      "$apiEndpoint/partner/franchise-deactivate-member"; // done
  static const partnerChangePasswordApi =
      "$apiEndpoint/partner/change-password"; // done
  static const freelancerOnboardStoresApi =
      "$apiEndpoint/partner/onboard-stores"; // done
  static const partnerProfileApi =
      "$apiEndpoint/partner/profile-details"; // done
  static const freelancerAllDetailsApi =
      "$apiEndpoint/partner/member-profile-details"; // done
  static const editMemberDetailsApi =
      "$apiEndpoint/partner/edit-profile"; // done
  static const restPasswordOtpApi =
      "$apiEndpoint/partner/reset-password-otp"; // done
  static const restPasswordApi = "$apiEndpoint/partner/reset-password"; // done
  static const franchiseOnboardStoreApi =
      "$apiEndpoint/partner/franchise-onboard-stores"; // done
  static const walletTransactionApi =
      "$apiEndpoint/partner/sales-transactions"; // done
  static const franchiseDashboardApi =
      "$apiEndpoint/partner/franchise-dashboard"; // done
  static const freelancerDashboardApi =
      "$apiEndpoint/partner/freelancer-dashboard"; // done
  static const freelancerAuditRequestApi =
      "$apiEndpoint/partner/store-onboard-audit-request"; // done

  static const String imageURL =
      'https://oonzoo-backend-storage.s3.us-west-2.amazonaws.com/';

  static const imgkitUrl = 'https://ik.imagekit.io/2msamvwg9/';
}
