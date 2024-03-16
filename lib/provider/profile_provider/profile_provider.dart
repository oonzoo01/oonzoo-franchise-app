import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:salesapp/api/api_service.dart';
import 'package:salesapp/model/profile_model/profile_model.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileModel? _profileDetails;
  ProfileModel? get profileDetails => _profileDetails;

  String? number;
  Timer? timer;
  int seconds = 0;

  Stopwatch watch = Stopwatch();

  bool isClockIn = false;
  String elapsedTime = '';

  setClockInValue() {
    isClockIn = !isClockIn;
    notifyListeners();
    if (isClockIn) {
      startTimer();
    }
  }

  void fetchProfileDetails() async {
    await APIService.getProfileData().then((value) {
      if (value != null) {
        _profileDetails = value;
      } else {
        _profileDetails = const ProfileModel();
      }
    });

    notifyListeners();
  }

  // void removeImage({String? type}) {
  //   if (type == "profile-pic") {
  //     _pr
  //   } else if (type == 'passport-front') {
  //     _proofIdFrontImage = null;
  //   } else if (type == 'passport-back') {
  //     _proofIdBackImage = null;
  //   } else if (type == 'license-front') {
  //     _frontlicenseimage = null;
  //   } else if (type == 'license-back') {
  //     _backlicenseimage = null;
  //   }
  // }

  void startTimer() {
    if (seconds == 0) {
      seconds = 1;
    }

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isClockIn) {
        seconds = seconds + 1;
      }

      if (!isClockIn) {
        log('timer');
        timer.cancel();
        timer.cancel();
      }
      notifyListeners();
    });
  }
}
