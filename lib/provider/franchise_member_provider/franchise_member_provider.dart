import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:salesapp/api/api_service.dart';
import 'package:salesapp/model/member_all_detils/member_all_details.dart';
import 'package:salesapp/view/partner_bottom_nav/partner_bottom_nav.dart';

import '../../constant/colors/colors.dart';
import '../../constant/const_data.dart';
import '../../model/franchise_member_model/franchise_member_model.dart';
import '../../utils/country_phone_field/countries.dart';
import '../../utils/utils.dart';

class FranchiseMemberProvider extends ChangeNotifier {
  List<FranchiseMemberModel>? _totalFranchiseMemberList;
  List<FranchiseMemberModel>? get totalFranchiseMemberList =>
      _totalFranchiseMemberList;

  List<FranchiseMemberModel>? _activeFranchiseMemberList;
  List<FranchiseMemberModel>? get activeFranchiseMemberList =>
      _activeFranchiseMemberList;

  List<FranchiseMemberModel>? _deactiveFranchiseMemberList;
  List<FranchiseMemberModel>? get deactiveFranchiseMemberList =>
      _deactiveFranchiseMemberList;

  FranchiseModel? _franchiseModel;
  FranchiseModel? get franchiseModel => _franchiseModel;

  MemberAllDetailsModel? _memberAllDetails;
  MemberAllDetailsModel? get memberAllDetails => _memberAllDetails;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController franchiseCode = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController dataOfBrithController = TextEditingController();
  TextEditingController nationalitycontroller = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController proofIdNoController = TextEditingController();

  File? _proofIdFrontImage;
  File? get proofIdFrontImage => _proofIdFrontImage;

  File? _proofIdBackImage;
  File? get proofIdBackImage => _proofIdBackImage;

  File? _frontlicenseimage;
  File? get frontlicenseimage => _frontlicenseimage;

  File? _backlicenseimage;
  File? get backlicenseimage => _backlicenseimage;

  File? _deliverymanimage;
  File? get deliverymanimage => _deliverymanimage;

  String _worldtext = ConstData.overtheworld.first;
  String get worldtext => _worldtext;

  String _passporttext = ConstData.passportfield.first;
  String get passporttext => _passporttext;

  int _totalmember = 0;
  int get totalmember => _totalmember;

  bool? _isActive;
  bool? get isActive => _isActive;

  bool _isEdit = true;
  bool get isEdit => _isEdit;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _countryCode;
  String? get countryCode => _countryCode;

  // int _page = 1;
  // int get page => _page;

  bool _fetchComplete = false;
  bool get fetchComplete => _fetchComplete;

  bool? isDeliveryImage;
  bool? isProofIdFront;
  bool? isProofIdBack;
  bool? isLincenseFront;
  bool? isLincenseBack;

  setCountryCode(val) {
    _countryCode = val;
    notifyListeners();
    log(_countryCode!, name: 'country code');
  }

  setEditProfile() {
    _isEdit = !_isEdit;
    notifyListeners();
  }

  setWorldText(val) {
    _worldtext = val;
    notifyListeners();
  }

  setProofId(val) {
    _passporttext = val;
    notifyListeners();
  }

  setNationality(val) {
    nationalitycontroller.text = val;
    notifyListeners();
  }

  setActive(val) {
    _isActive = val;
    notifyListeners();
  }

  setActiveStatus(val, index) {
    _totalFranchiseMemberList![index] =
        _totalFranchiseMemberList![index].copyWith(status: val);
    notifyListeners();
  }

  // setPageNumber(val) {
  //   _page = val;
  //   notifyListeners();
  //   fetchAllFranchiseMember();
  // }

  Future<void> pickImage(ImageSource source, {String? type}) async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      final String? cropImg = await cropImage(imageFile: pickedFile.path);
      if (cropImg != null) {
        if (type == 'passport-front') {
          _proofIdFrontImage = File(cropImg);
          log(_proofIdFrontImage.toString(), name: 'proof Id Front image');
        } else if (type == 'passport-back') {
          _proofIdBackImage = File(cropImg);
          log(_proofIdBackImage.toString(), name: 'proof id bakc image');
        } else if (type == 'license-front') {
          _frontlicenseimage = File(cropImg);
          log(_frontlicenseimage.toString(), name: 'front license');
        } else if (type == 'license-back') {
          _backlicenseimage = File(cropImg);
          log(_backlicenseimage.toString(), name: 'back license');
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
      _memberAllDetails = _memberAllDetails?.copyWith(proofIDFrontImage: null);
    } else if (type == 'passport-back') {
      _proofIdBackImage = null;
      _memberAllDetails = _memberAllDetails?.copyWith(proofIDBackImage: null);
    } else if (type == 'license-front') {
      _frontlicenseimage = null;
      _memberAllDetails =
          _memberAllDetails?.copyWith(drivingLicenseFrontImage: null);
    } else if (type == 'license-back') {
      _backlicenseimage = null;
      _memberAllDetails =
          _memberAllDetails?.copyWith(drivingLicenseBackImage: null);
    }
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

  void removedeliverymanimage() {
    _deliverymanimage = null;
    _memberAllDetails = _memberAllDetails?.copyWith(profilePic: null);
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

  fetchMemberData(MemberAllDetailsModel model) {
    _countryCode = null;
    notifyListeners();
    firstName.text = model.fullName ?? '';
    List<String> parts = model.mobile!.split(' ');
    // log(model.mobile.toString());

    phoneNumber.text = parts[1];
    for (var element in countries) {
      if (element.dialCode == parts[0]) {
        // log(parts[0]);
        // log(element.dialCode.toString());
        _countryCode = element.code;  
      } else {
        // log('else case');
      }
    }

    email.text = model.email ?? '';
    _worldtext = model.workCountry == 'UAE'
        ? ConstData.overtheworld.first
        : ConstData.overtheworld.last;
    nationalitycontroller.text = model.nationality ?? '';
    _passporttext =
        model.proofID == 'PASSPORT' ? 'Passport' : model.proofID ?? '';
    proofIdNoController.text = model.proofIDNo ?? '';
    dataOfBrithController.text = Utils.formatDateOnly(model.dateofBirth);
    ageController.text = "${model.age ?? 0}";
    notifyListeners();
  }

  Future<void> checkImage() async {
    if (_memberAllDetails?.profilePic != null) {
      isDeliveryImage = true;
    } else if (_deliverymanimage != null) {
      isDeliveryImage = true;
    } else {
      isDeliveryImage = false;
    }
    if (_memberAllDetails?.proofIDFrontImage != null) {
      isProofIdFront = true;
    } else if (_proofIdFrontImage != null) {
      isProofIdFront = true;
    } else {
      isProofIdFront = false;
    }
    if (_memberAllDetails?.proofIDBackImage != null) {
      isProofIdBack = true;
    } else if (_proofIdBackImage != null) {
      isProofIdBack = true;
    } else {
      isProofIdBack = false;
    }
    if (_memberAllDetails?.drivingLicenseFrontImage != null) {
      isLincenseFront = true;
    } else if (_frontlicenseimage != null) {
      isLincenseFront = true;
    } else {
      isLincenseFront = false;
    }
    if (_memberAllDetails?.drivingLicenseBackImage != null) {
      isLincenseBack = true;
    } else if (_backlicenseimage != null) {
      isLincenseBack = true;
    } else {
      isLincenseBack = false;
    }
  }

  void checkIsEditOrNot(context) async {
    // if (
    //   _memberAllDetails?.fullName != firstName.text ||
    //     _memberAllDetails?.nationality != nationalitycontroller.text ||
    //     _memberAllDetails?.workCountry != _worldtext ||
    //     _memberAllDetails?.proofID != _passporttext.toUpperCase() ||
    //     _memberAllDetails?.proofIDNo != proofIdNoController.text ||
    //     _memberAllDetails?.age.toString() != ageController.text ||
    //     Utils.formatDateOnly(_memberAllDetails?.dateofBirth) !=
    //         dataOfBrithController.text ||
    //     _deliverymanimage != null ||
    //     _proofIdFrontImage != null ||
    //     _proofIdBackImage != null ||
    //     _backlicenseimage != null ||
    //     _frontlicenseimage != null) {
    _isLoading = true;
    notifyListeners();
    await checkImage();
    if ((isDeliveryImage ?? false) &&
        (isProofIdFront ?? false) &&
        (isProofIdBack ?? false) &&
        (isLincenseFront ?? false) &&
        (isLincenseBack ?? false)) {
      final mobile = _countryCode == null
          ? "971 ${phoneNumber.text}"
          : "$_countryCode ${phoneNumber.text}";
      await APIService.updatedMemberDetails(
        _memberAllDetails?.userId ?? '',
        _memberAllDetails?.partnerId ?? '',
        firstName.text.trim(),
        mobile.trim(),
        email.text.trim(),
        _worldtext,
        nationalitycontroller.text.trim(),
        passporttext,
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
          _memberAllDetails = value;
          setEditProfile();
          fetchAllFranchiseMember();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const PartnerBottomNav(selectedIndex: 2),
            ),
          );
          clearFormData();
        } else {}
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
  }

  void fetchAllFranchiseMember() async {
    log('fetch all franchise');

    notifyListeners();
    await APIService.getAllFranchiseMember("1", "100").then((list) {
      if (list != null) {
        _franchiseModel = list;

        _totalFranchiseMemberList = _franchiseModel?.data;
        _activeFranchiseMemberList =
            _totalFranchiseMemberList!.where((e) => e.status == true).toList();
        _deactiveFranchiseMemberList =
            _totalFranchiseMemberList!.where((e) => e.status == false).toList();
      } else {
        _franchiseModel = const FranchiseModel();
        _totalFranchiseMemberList = [];
      }
    });
    log(_totalFranchiseMemberList!.length.toString());
    notifyListeners();
  }

  void fetchFranchiseMemberAllDetails(id, callback) async {
    await APIService.fetchFreelancerDetails(id).then((value) {
      if (value != null) {
        _memberAllDetails = value;
        fetchMemberData(_memberAllDetails ?? const MemberAllDetailsModel());
        callback(value);
      } else {
        _memberAllDetails = const MemberAllDetailsModel();
      }
    });
    // log(_memberAllDetails.toString());
    notifyListeners();
  }

  setTotalMember(val) {
    _totalmember = val;
    notifyListeners();
  }

  void addActiveMember(userId, callback) async {
    final res = await APIService.addActiveMember(userId);
    if (res != null) {
      fetchAllFranchiseMember();
    }

    callback(res);
  }

  void deactiveMember(userId, callback) async {
    final res = await APIService.dctiveMember(userId);
    if (res != null) {
      fetchAllFranchiseMember();
    }

    callback(res);
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
    // RegExp regex = RegExp(r'^[0-9]{10}$');
    // final match = regex.hasMatch(input);
    if (input.trim().isEmpty) {
      return '* Field Required';
    }
    // if (!match) {
    //   return 'Invalid NID number';
    // }
    return null;
  }

  clearFormData() {
    firstName.clear();
    lastName.clear();
    phoneNumber.clear();
    franchiseCode.clear();
    email.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    dataOfBrithController.clear();
    nationalitycontroller.clear();
    ageController.clear();
    _countryCode == null;
    proofIdNoController.clear();
    _proofIdFrontImage = null;
    _proofIdBackImage = null;
    _frontlicenseimage = null;
    _backlicenseimage = null;
    _deliverymanimage = null;
    _countryCode = null;
    notifyListeners();
  }
}
