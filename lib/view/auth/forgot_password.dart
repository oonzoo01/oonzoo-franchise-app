import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/common_widget/custom_poppins.dart';
import 'package:salesapp/constant/colors/colors.dart';
import 'package:salesapp/provider/auth_provider/forgot_password_provider.dart';
import 'package:salesapp/provider/auth_provider/register_provider.dart';
import 'package:salesapp/utils/utils.dart';
import 'package:salesapp/view/auth/verification_screen.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({
    Key? key,
    // required this.partnerType,
  }) : super(key: key);
  // final String partnerType;

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  // final TextEditingController _numberController = TextEditingController();
  // String? countryDialCode = '+971';
  // CountryCode.fromCountryCode("ae").dialCode;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (val) {
        Provider.of<ForgotPasswordProvider>(context, listen: false)
            .clearFrom(context);
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: kwhite,
        appBar: AppBar(
          leading: BackButton(
            color: kblack,
            onPressed: () {
              Provider.of<ForgotPasswordProvider>(context, listen: false)
                  .clearFrom(context);
              Navigator.pop(context);
            },
          ),
          backgroundColor: kwhite,
          elevation: 1,
          title: const CustomPoppinsText(
            text: "Forgot Password",
            fontSize: 16,
            color: kblack,
          ),
        ),
        body: ProgressHUD(
          key: UniqueKey(),
          inAsyncCall:
              Provider.of<ForgotPasswordProvider>(context).isLoading ?? false,
          child: SafeArea(
            child: Center(
              child: Scrollbar(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: SizedBox(
                      width: 1170,
                      child: Form(
                        key: globalKey,
                        child: Column(children: [
                          Image.asset("assets/images/forgot.png", height: 220),
                          const Padding(
                            padding: EdgeInsets.all(30),
                            child: Text('Please Enter Email',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: kblack),
                                textAlign: TextAlign.center),
                          ),
                          TextFormField(
                            style: const TextStyle(
                              color: kblack,
                            ),
                            cursorColor: lightOrange,
                            keyboardType: TextInputType.emailAddress,
                            controller:
                                Provider.of<ForgotPasswordProvider>(context)
                                    .emailController,
                            decoration: InputDecoration(
                              counterText: "",
                              hintText: "Enter your Email",
                              prefixIcon: Icon(
                                Icons.email_rounded,
                                color: lightOrange,
                              ),
                              fillColor: Colors.grey.withOpacity(0.1),
                              filled: true,
                              hintStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(0.6)),
                              border: const UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "* Email Required";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(lightOrange),
                            ),
                            onPressed: () {
                              if (globalKey.currentState!.validate()) {
                                Provider.of<ForgotPasswordProvider>(context,
                                        listen: false)
                                    .restPasswordOtp(
                                  // widget.partnerType,
                                  (val) {
                                    if (val != null) {
                                      Provider.of<RegisterProvider>(context,
                                              listen: false)
                                          .startTimer();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              VerificationScreen(
                                            number: Provider.of<
                                                        ForgotPasswordProvider>(
                                                    context,
                                                    listen: false)
                                                .emailController
                                                .text,
                                            isForgot: true,
                                          ),
                                        ),
                                      );
                                    } else {
                                      Utils.showToastMessage(
                                        context,
                                        "Invalid Email!",
                                        isError: true,
                                        position: StyledToastPosition.top,
                                      );
                                    }
                                  },
                                );
                              }
                            },
                            child: const Text(
                              'Next',
                              style: TextStyle(color: kwhite),
                            ),
                          )
                          // GetBuilder<AuthController>(builder: (authController) {
                          //   return !authController.isLoading
                          //       ? CustomButton(
                          //           buttonText: 'next'.tr,
                          //           onPressed: () => _forgetPass(_countryDialCode!),
                          //         )
                          //       : const Center(child: CircularProgressIndicator());
                          // }),
                        ]),
                      ),
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

  // void _forgetPass(String countryCode) async {
  //   String phone = _numberController.text.trim();

  //   String numberWithCountryCode = countryCode + phone;
  //   bool isValid = false;
  //   try {
  //     PhoneNumber phoneNumber =
  //         await PhoneNumberUtil().parse(numberWithCountryCode);
  //     numberWithCountryCode =
  //         '+${phoneNumber.countryCode}${phoneNumber.nationalNumber}';
  //     isValid = true;
  //   } catch (_) {}

  //   if (phone.isEmpty) {
  //     showCustomSnackBar('enter_phone_number'.tr);
  //   } else if (!isValid) {
  //     showCustomSnackBar('invalid_phone_number'.tr);
  //   } else {
  //     Get.find<AuthController>()
  //         .forgetPassword(numberWithCountryCode)
  //         .then((status) async {
  //       if (status.isSuccess) {
  //         Get.toNamed(RouteHelper.getVerificationRoute(numberWithCountryCode));
  //       } else {
  //         showCustomSnackBar(status.message);
  //       }
  //     });
  //   }
  // }
}
