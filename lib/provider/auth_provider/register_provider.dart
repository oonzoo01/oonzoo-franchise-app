import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/api/api_service.dart';
import 'package:salesapp/constant/colors/colors.dart';
import 'package:salesapp/constant/const_data.dart';
import 'package:salesapp/utils/utils.dart';
import 'package:salesapp/view/partner_bottom_nav/partner_bottom_nav.dart';

import '../../model/profile_model/profile_model.dart';
import '../profile_provider/profile_provider.dart';

class RegisterProvider extends ChangeNotifier {
  // RegistrationModel? _registrationModel;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController franchiseCode = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController dataOfBrithController = TextEditingController();
  TextEditingController nationalitycontroller = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController proofIdNoController = TextEditingController();
  TextEditingController oldPassword = TextEditingController();

  String? _selectedPartnerType;
  String? get selectedPartnerType => _selectedPartnerType;

  String? _hashCodes;
  String? get hashCodes => _hashCodes;

  String? _countryCode;
  String? get countryCode => _countryCode;

  File? _deliverymanimage;
  File? get deliverymanimage => _deliverymanimage;

  File? _proofIdFrontImage;
  File? get proofIdFrontImage => _proofIdFrontImage;

  File? _proofIdBackImage;
  File? get proofIdBackImage => _proofIdBackImage;

  File? _frontlicenseimage;
  File? get frontlicenseimage => _frontlicenseimage;

  File? _backlicenseimage;
  File? get backlicenseimage => _backlicenseimage;

  bool _passwordVisible = true;
  bool get passwordVisible => _passwordVisible;

  bool _confirmpassword = true;
  bool get confirmpassword => _confirmpassword;

  String _worldtext = ConstData.overtheworld.first;
  String get worldtext => _worldtext;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isRegLoading = false;
  bool get isRegLoading => _isRegLoading;

  Timer? timer;
  int seconds = 0;

  String _passporttext = ConstData.passportfield.first;
  String get passporttext => _passporttext;

  bool? isDeliveryImage;
  bool? isProofIdFront;
  bool? isProofIdBack;
  bool? isLincenseFront;
  bool? isLincenseBack;

  setCountryCode(val) {
    _countryCode = val;
    notifyListeners();
  }

  void startTimer() {
    seconds = 60;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds = seconds - 1;
      if (seconds == 0) {
        timer.cancel();
      }
      notifyListeners();
    });
  }

  void timeDispose() {
    timer?.cancel();
    notifyListeners();
  }

  Future<void> pickImage(ImageSource source, {String? type}) async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      final String? cropImg = await cropImage(imageFile: pickedFile.path);
      if (cropImg != null) {
        if (type == 'passport-front') {
          _proofIdFrontImage = File(cropImg);
        } else if (type == 'passport-back') {
          _proofIdBackImage = File(cropImg);
        } else if (type == 'license-front') {
          _frontlicenseimage = File(cropImg);
        } else if (type == 'license-back') {
          _backlicenseimage = File(cropImg);
        }
      }

      notifyListeners();
    }
  }

  Future<String?> cropImage({required String imageFile}) async {
    CroppedFile? croppedIMage = await ImageCropper().cropImage(
      sourcePath: imageFile,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'oonzoo',
          toolbarColor: korange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
          hideBottomControls: true,
        ),
        IOSUiSettings(
          title: 'oonzoo',
          rotateButtonsHidden: true,
        ),
      ],
    );
    if (croppedIMage == null) {
      return null;
    }
    return (croppedIMage.path);
  }

  void removeImage({String? type}) {
    if (type == 'passport-front') {
      _proofIdFrontImage = null;
    } else if (type == 'passport-back') {
      _proofIdBackImage = null;
    } else if (type == 'license-front') {
      _frontlicenseimage = null;
    } else if (type == 'license-back') {
      _backlicenseimage = null;
    }
    notifyListeners();
  }

  Future<void> checkImage(ProfileModel model) async {
    if (model.profilePic != null) {
      isDeliveryImage = true;
    } else if (_deliverymanimage != null) {
      isDeliveryImage = true;
    } else {
      isDeliveryImage = false;
    }
    if (model.proofIDFrontImage != null) {
      isProofIdFront = true;
    } else if (_proofIdFrontImage != null) {
      isProofIdFront = true;
    } else {
      isProofIdFront = false;
    }
    if (model.proofIDBackImage != null) {
      isProofIdBack = true;
    } else if (_proofIdBackImage != null) {
      isProofIdBack = true;
    } else {
      isProofIdBack = false;
    }
    if (model.drivingLicenseFrontImage != null) {
      isLincenseFront = true;
    } else if (_frontlicenseimage != null) {
      isLincenseFront = true;
    } else {
      isLincenseFront = false;
    }
    if (model.drivingLicenseBackImage != null) {
      isLincenseBack = true;
    } else if (_backlicenseimage != null) {
      isLincenseBack = true;
    } else {
      isLincenseBack = false;
    }
  }

  void checkIsEditOrNot(ProfileModel model, context) async {
    // if (model.fullName != firstName.text ||
    //     model.nationality != nationalitycontroller.text ||
    //     model.workCountry != _worldtext ||
    //     model.mobile != phoneNumber.text ||
    //     model.proofID != _passporttext.toUpperCase() ||
    //     model.proofIDNo != proofIdNoController.text ||
    //     model.age.toString() != ageController.text ||
    //     Utils.formatDateOnly(model.dateofBirth) != dataOfBrithController.text ||
    //     _deliverymanimage != null ||
    //     _proofIdFrontImage != null ||
    //     _proofIdBackImage != null ||
    //     _backlicenseimage != null ||
    //     _frontlicenseimage != null) {

    _isLoading = true;
    notifyListeners();
    await checkImage(model);
    if ((isDeliveryImage ?? false) &&
        (isProofIdFront ?? false) &&
        (isProofIdBack ?? false) &&
        (isLincenseFront ?? false) &&
        (isLincenseBack ?? false)) {
      final mobile = _countryCode == null
          ? "971 ${phoneNumber.text}"
          : "$_countryCode ${phoneNumber.text}";
      await APIService.updatedMemberDetails(
        model.userId ?? '',
        model.partnerId ?? '',
        firstName.text.trim(),
        mobile.trim(),
        model.email ?? '',
        _worldtext,
        nationalitycontroller.text.trim(),
        _passporttext,
        proofIdNoController.text.trim(),
        ageController.text.trim(),
        dataOfBrithController.text.trim(),
        _proofIdFrontImage?.path ?? '',
        _proofIdBackImage?.path ?? '',
        _frontlicenseimage?.path ?? '',
        _backlicenseimage?.path ?? '',
        _deliverymanimage?.path ?? '',
      ).then((value) {
        if (value != null) {
          log('check value');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const PartnerBottomNav(selectedIndex: 3),
            ),
          );
          Provider.of<ProfileProvider>(context, listen: false)
              .fetchProfileDetails();
          clearAllRegistorForm();
        }
      });
    } else {
      Utils.showToastMessage(
        context,
        "Please add all photos",
        isError: true,
        position: StyledToastPosition.top,
      );
    }

    _isLoading = false;
    notifyListeners();
    // } else {
    //   Utils.showToastMessage(
    //     context,
    //     "Noting Edit",
    //     isError: true,
    //     position: StyledToastPosition.top,
    //   );
    // }
  }

  fetchProfileData(ProfileModel model) {
    // _deliverymanimage = File(model.profilePic ?? '');
    firstName.text = model.fullName ?? '';
    _worldtext = model.workCountry == 'UAE'
        ? ConstData.overtheworld.first
        : ConstData.overtheworld.last;
    nationalitycontroller.text = model.nationality ?? '';
    List<String> parts = model.mobile!.split(' ');

    phoneNumber.text = parts[1];
    for (var element in ConstData.conutryCode) {
      if (element['code'] == parts[0]) {
        _countryCode = element['country'] ?? '';
      }
    }
    // phoneNumber.text = model.mobile ?? '';
    // email.text = model.email ?? '';
    _passporttext =
        model.proofID == 'PASSPORT' ? 'Passport' : model.proofID ?? '';
    proofIdNoController.text = model.proofIDNo ?? '';
    // _proofIdFrontImage = File(model.proofIDFrontImage ?? '');
    // _proofIdBackImage = File(model.proofIDBackImage ?? '');
    dataOfBrithController.text = Utils.formatDateOnly(model.dateofBirth);
    ageController.text = "${model.age ?? 0}";
    // _frontlicenseimage = File(model.drivingLicenseFrontImage ?? '');
    // _backlicenseimage = File(model.drivingLicenseBackImage ?? '');
    notifyListeners();
  }

  void disposeOtp() {
    otpController.clear();
    notifyListeners();
  }

  void partnerProfileRegister(callback) async {
    _isRegLoading = true;
    notifyListeners();

    final res = await APIService.partnerProfileRegistration(
      _worldtext == 'United Arab Emirates' ? 'UAE' : "All",
      nationalitycontroller.text.trim(),
      _passporttext,
      proofIdNoController.text.trim(),
      dataOfBrithController.text,
      _proofIdFrontImage?.path ?? '',
      _proofIdBackImage?.path ?? '',
      _frontlicenseimage?.path ?? '',
      _backlicenseimage?.path ?? '',
      _deliverymanimage?.path ?? '',
      franchiseCode.text.trim(),
    );

    if (res != null) {
      clearAllRegistorForm();
    }
    callback(res);
    _isRegLoading = false;
    notifyListeners();
  }

  void parterSignUp(ctx, callback) async {
    timeDispose();
    startTimer();
    _isLoading = true;
    notifyListeners();

    final res = await APIService.partnerRegistration(
        email.text, _selectedPartnerType ?? '');

    if (res != null) {
      _hashCodes = res;
    }
    _isLoading = false;
    notifyListeners();
    callback(res);
  }

  void verifyPartnerOtp(callback) async {
    _isLoading = true;
    notifyListeners();

    final fullName = (firstName.text.trim());
    final mobile = _countryCode == null
        ? "971 ${phoneNumber.text}"
        : "$_countryCode ${phoneNumber.text}";
    final res = await APIService.verifyPartnerOtp(
      email.text,
      _selectedPartnerType ?? '',
      _hashCodes ?? '',
      otpController.text,
      fullName,
      passwordController.text,
      mobile,
    );

    if (res) {
      clearAllForm();
    }

    _isLoading = false;
    notifyListeners();
    callback(res);
  }

  void partnerChangePassword(callback) async {
    _isLoading = true;
    notifyListeners();
    final res = await APIService.partnerChangePassword(
      oldPassword.text,
      passwordController.text,
    );

    _isLoading = false;
    notifyListeners();
    callback(res);
    clearPassword();
  }

  setWrold(val) {
    _worldtext = val;
    notifyListeners();
  }

  setIdType(val) {
    _passporttext = val;
    notifyListeners();
  }

  setPartnerType(val) {
    _selectedPartnerType = val;
    notifyListeners();
  }

  void removedeliverymanimage() {
    _deliverymanimage = null;
    notifyListeners();
  }

  setHasCode(val) {
    _hashCodes = val;
    notifyListeners();
  }

  Future<void> pickdeliverymanImage(ImageSource source) async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      final String? cropImg = await cropImage(imageFile: pickedFile.path);
      if (cropImg != null) {
        _deliverymanimage = File(cropImg);
      }
      notifyListeners();
    }
  }

  setPasswordObscureText() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }

  setConfirmpasswordObscureText() {
    _confirmpassword = !_confirmpassword;
    notifyListeners();
  }

  setNatinality(val) {
    nationalitycontroller.text = val;
    notifyListeners();
  }

  Future<void> startdate(context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        initialDate: DateTime.now());
    if (picked != null) {
      final agePeriod = DateTime.now().year - picked.year;

      if (ageController.text.trim() != '') {
        if (agePeriod >= 18) {
          if (agePeriod == int.parse(ageController.text)) {
            dataOfBrithController.text = DateFormat.yMd().format(picked);
          } else {
            Utils.showToastMessage(
              context,
              'Please select your correct age',
              isError: true,
              position: StyledToastPosition.top,
            );
          }
        } else {
          Utils.showToastMessage(
            context,
            'Must be 18 or Older',
            isError: true,
            position: StyledToastPosition.top,
          );
        }
      } else {
        Utils.showToastMessage(
          context,
          "Please enter your age",
          isError: true,
          position: StyledToastPosition.top,
        );
      }
    }
    notifyListeners();
  }

  String? isPasswordValid(String password) {
    // Define regular expressions for password criteria
    RegExp lowercaseRegex = RegExp(r'[a-z]');
    RegExp uppercaseRegex = RegExp(r'[A-Z]');
    RegExp digitRegex = RegExp(r'\d');
    RegExp specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

    // Check if the password meets all criteria
    bool hasLowercase = lowercaseRegex.hasMatch(password);
    bool hasUppercase = uppercaseRegex.hasMatch(password);
    bool hasDigit = digitRegex.hasMatch(password);
    bool hasSpecialChar = specialCharRegex.hasMatch(password);
    bool hasMinLength = password.length >= 8; // Minimum length of 8 characters

    // Return true if all criteria are met, String otherwise
    if (password.trim().isEmpty) {
      return "* Field Required";
    }

    if ((!hasLowercase) ||
        (!hasUppercase) ||
        (!hasDigit) ||
        (!hasSpecialChar)) {
      return 'Enter Strong Password';
    }

    if (!hasMinLength) {
      return 'Enter 8 Charecter';
    }
    return null;
  }

  String? validatePassport(String input) {
    // RegExp regex = RegExp(r'^[A-Z0-9]{8,9}$');
    // final match = regex.hasMatch(input);
    if (input.trim().isEmpty) {
      return '* Field Required';
    }
    // if (!match) {
    //   log('not match');
    //   return 'Invalid passport number';
    // }
    return null;
  }

  String? validateNationalID(String input) {
    // RegExp regex = RegExp(r'^[0-9]{5,10}$');
    // final match = regex.hasMatch(input);
    if (input.trim().isEmpty) {
      return '* Field Required';
    }
    // if (!match) {
    //   return 'Invalid NID number';
    // }
    return null;
  }

  void clearAllRegistorForm() {
    _deliverymanimage = null;
    _proofIdFrontImage = null;
    _proofIdBackImage = null;
    _frontlicenseimage = null;
    _backlicenseimage = null;
    _worldtext = ConstData.overtheworld.first;
    _passporttext = ConstData.passportfield.first;
    ageController.clear();
    nationalitycontroller.clear();
    proofIdNoController.clear();
    dataOfBrithController.clear();
    _selectedPartnerType = null;
    notifyListeners();
  }

  clearPassword() {
    oldPassword.clear();
    passwordController.clear();
    notifyListeners();
  }

  void clearAllForm() {
    otpController.clear();
    firstName.clear();
    lastName.clear();
    phoneNumber.clear();
    franchiseCode.clear();
    email.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    _countryCode = null;
    _hashCodes = null;

    notifyListeners();
  }
}
