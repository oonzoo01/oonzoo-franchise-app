import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/constant/colors/colors.dart';
import 'package:salesapp/constant/size/size.dart';
import 'package:salesapp/provider/auth_provider/forgot_password_provider.dart';
import 'package:salesapp/provider/auth_provider/register_provider.dart';
import 'package:salesapp/utils/utils.dart';
import 'package:salesapp/view/auth/new_password.dart';
import 'package:salesapp/view/auth/registration_screen.dart';

import '../../utils/custom_appbar/custom_appbar.dart';

class VerificationScreen extends StatefulWidget {
  final String? number;
  final bool isForgot;
  const VerificationScreen({
    Key? key,
    required this.number,
    required this.isForgot,
  }) : super(key: key);

  @override
  VerificationScreenState createState() => VerificationScreenState();
}

class VerificationScreenState extends State<VerificationScreen> {
  String? _number;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<RegisterProvider>(context, listen: false).disposeOtp();
    });
    _number =
        // widget.number!.startsWith('+')
        //     ? widget.number
        //     :
        widget.number;
    // _startTimer();
  }

  // @override
  // void dispose() {
  //   super.dispose();

  //   _timer?.cancel();
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<RegisterProvider>(context, listen: false).timeDispose();
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: CustomAppBar(
          title: 'OTP VERIFICATION',
          backgroundColor: kwhite,
          titleColor: kblack,
          iconColor: kblack,
          onBackPressed: () {
            Provider.of<RegisterProvider>(context, listen: false).timeDispose();
            Navigator.pop(context);
          },
        ),
        body: SafeArea(
          child: Center(
            child: Scrollbar(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: SizedBox(
                    width: 1170,
                    child: Column(
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Enter the verification code sent to',
                                style: TextStyle(
                                    color: Theme.of(context).disabledColor),
                              ),
                              TextSpan(
                                text: ' $_number',
                                style: const TextStyle(
                                  color: kblack,
                                  // Theme.of(context)
                                  //     .textTheme
                                  //     .bodyLarge!
                                  //     .color,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 39,
                            vertical: 35,
                          ),
                          child: PinCodeTextField(
                            length: 4,
                            appContext: context,
                            keyboardType: TextInputType.number,
                            animationType: AnimationType.slide,
                            autoDisposeControllers: false,
                            controller: widget.isForgot
                                ? Provider.of<ForgotPasswordProvider>(context)
                                    .otpController
                                : Provider.of<RegisterProvider>(context,
                                        listen: false)
                                    .otpController,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              fieldHeight: 60,
                              fieldWidth: 60,
                              borderWidth: 1,
                              borderRadius: BorderRadius.circular(5),
                              selectedColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.2),
                              selectedFillColor: Colors.white,
                              inactiveFillColor: Theme.of(context)
                                  .disabledColor
                                  .withOpacity(0.2),
                              inactiveColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.2),
                              activeColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.4),
                              activeFillColor: Theme.of(context)
                                  .disabledColor
                                  .withOpacity(0.2),
                            ),
                            animationDuration:
                                const Duration(milliseconds: 300),
                            backgroundColor: Colors.transparent,
                            enableActiveFill: true,
                            onChanged: (value) {},
                            beforeTextPaste: (text) => true,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Did not receive the code',
                              style: TextStyle(
                                  color: Theme.of(context).disabledColor),
                            ),
                            TextButton(
                              onPressed: Provider.of<RegisterProvider>(context)
                                          .seconds <
                                      1
                                  ? () {
                                      log(Provider.of<RegisterProvider>(context,
                                              listen: false)
                                          .selectedPartnerType
                                          .toString());
                                      if (widget.isForgot) {
                                        Provider.of<ForgotPasswordProvider>(
                                                context,
                                                listen: false)
                                            .restPasswordOtp(
                                          // Provider.of<LoginProvider>(context,
                                          //         listen: false)
                                          //     .selectedPartnerType,
                                          (val) {
                                            if (val != null) {
                                              Provider.of<RegisterProvider>(
                                                      context,
                                                      listen: false)
                                                  .timeDispose();
                                              Provider.of<RegisterProvider>(
                                                      context,
                                                      listen: false)
                                                  .startTimer();
                                            }
                                          },
                                        );
                                      } else {
                                        Provider.of<RegisterProvider>(context,
                                                listen: false)
                                            .parterSignUp(
                                          context,
                                          (val) {},
                                        );
                                      }
                                      // authController
                                      //     .forgetPassword(widget.number)
                                      //     .then((value) {
                                      //   if (value.isSuccess) {
                                      //     showCustomSnackBar(
                                      //         'resend_code_successful'.tr,
                                      //         isError: false);
                                      //   } else {
                                      //     showCustomSnackBar(value.message);
                                      //   }
                                      // });
                                    }
                                  : null,
                              child: Text(
                                '${'Resend'}${Provider.of<RegisterProvider>(context).seconds > 0 ? ' (${Provider.of<RegisterProvider>(context).seconds})' : ''}',
                                style: TextStyle(color: lightOrange),
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(lightOrange),
                          ),
                          onPressed: () {
                            if (widget.isForgot) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NewPassScreen(
                                    // resetToken: '',
                                    // number: '45874544',

                                    fromPasswordChange: true,
                                  ),
                                ),
                              );
                            } else {
                              Provider.of<RegisterProvider>(context,
                                      listen: false)
                                  .verifyPartnerOtp(
                                (val) {
                                  if (val) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RegistrationPage(),
                                      ),
                                    );
                                  } else {
                                    Utils.showToastMessage(
                                      context,
                                      'Invalid Otp',
                                      isError: true,
                                      position: StyledToastPosition.top,
                                    );
                                  }
                                },
                              );
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Verify',
                                style: TextStyle(
                                  color: kwhite,
                                ),
                              ),
                              if (Provider.of<RegisterProvider>(context,
                                      listen: false)
                                  .isLoading)
                                kwidth,
                              if (Provider.of<RegisterProvider>(context)
                                  .isLoading)
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    backgroundColor: lightOrange,
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            kwhite),
                                  ),
                                )
                            ],
                          ),
                        ),
                        // authController.verificationCode.length == 4
                        //     ? !authController.isLoading
                        //         ? CustomButton(
                        //             buttonText: 'verify'.tr,
                        //             onPressed: () {
                        //               authController.verifyToken(_number).then((value) {
                        //                 if (value.isSuccess) {
                        //                   Get.toNamed(RouteHelper.getResetPasswordRoute(
                        //                       _number,
                        //                       authController.verificationCode,
                        //                       'reset-password'));
                        //                 } else {
                        //                   showCustomSnackBar(value.message);
                        //                 }
                        //               });
                        //             },
                        //           )
                        //         : const Center(child: CircularProgressIndicator())
                        //     : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
