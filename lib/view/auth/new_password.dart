import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/constant/colors/colors.dart';
import 'package:salesapp/constant/size/size.dart';
import 'package:salesapp/login_page.dart';
import 'package:salesapp/provider/auth_provider/forgot_password_provider.dart';
import 'package:salesapp/provider/auth_provider/login_provider.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

import '../../utils/custom_appbar/custom_appbar.dart';
import '../../utils/custom_text_form.dart';

class NewPassScreen extends StatefulWidget {
  // final String? resetToken;

  final bool fromPasswordChange;
  const NewPassScreen({
    Key? key,
    // required this.resetToken,

    required this.fromPasswordChange,
  }) : super(key: key);

  @override
  State<NewPassScreen> createState() => _NewPassScreenState();
}

class _NewPassScreenState extends State<NewPassScreen> {
  // final TextEditingController _newPasswordController = TextEditingController();
  // final TextEditingController _confirmPasswordController =
  //     TextEditingController();
  final FocusNode _newPasswordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
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
        appBar: CustomAppBar(
          onBackPressed: () {
            Provider.of<ForgotPasswordProvider>(context, listen: false)
                .clearFrom(context);
            Navigator.pop(context);
          },
          title:
              widget.fromPasswordChange ? 'Change Password' : 'Reset Password',
          backgroundColor: kwhite,
          titleColor: kblack,
          iconColor: kblack,
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
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/unlocked-with-new-password.png',
                              width: 150,
                            ),
                            kheight15,
                            const Text(
                              'Enter new password',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: kblack,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 50),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Theme.of(context).cardColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[200]!,
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                  )
                                ],
                              ),
                              child: Column(
                                children: [
                                  CustomTextField(
                                    hintText: 'New Password',
                                    controller:
                                        Provider.of<ForgotPasswordProvider>(
                                                context)
                                            .newPasswordController,
                                    focusNode: _newPasswordFocus,
                                    nextFocus: _confirmPasswordFocus,
                                    inputType: TextInputType.visiblePassword,
                                    prefixIcon: Icons.lock,
                                    isPassword: true,
                                    divider: true,
                                    validator: (val) {
                                      return Provider.of<
                                              ForgotPasswordProvider>(context)
                                          .isPasswordValid(val ?? '');
                                    },
                                  ),
                                  CustomTextField(
                                    hintText: 'Confirm Password',
                                    controller:
                                        Provider.of<ForgotPasswordProvider>(
                                                context)
                                            .confirmPasswordController,
                                    focusNode: _confirmPasswordFocus,
                                    inputAction: TextInputAction.done,
                                    inputType: TextInputType.visiblePassword,
                                    prefixIcon: Icons.lock,
                                    isPassword: true,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "* Confirm Password Required";
                                      }
                                      if (val.trim() !=
                                          Provider.of<ForgotPasswordProvider>(
                                                  context)
                                              .newPasswordController
                                              .text
                                              .trim()) {
                                        return "Invalid Confirm Password";
                                      }
                                      return null;
                                    },
                                    // onSubmit: (text) =>
                                    //     GetPlatform.isWeb ? _resetPassword() : null,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(lightOrange),
                              ),
                              onPressed: () {
                                if (globalKey.currentState!.validate()) {
                                  Provider.of<ForgotPasswordProvider>(context,
                                          listen: false)
                                      .restPasswordVerify(
                                    context,
                                    Provider.of<LoginProvider>(context,
                                            listen: false)
                                        .selectedPartnerType,
                                    (val) {
                                      if (val != null) {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const SignInPage(),
                                          ),
                                          (route) => false,
                                        );
                                      }
                                    },
                                  );
                                }
                              },
                              child: const Text(
                                'Done',
                                style: TextStyle(
                                  color: kwhite,
                                ),
                              ),
                            ),
                            // GetBuilder<AuthController>(builder: (authController) {
                            //   return !authController.isLoading
                            //       ? CustomButton(
                            //           buttonText: 'done'.tr,
                            //           onPressed: () => _resetPassword(),
                            //         )
                            //       : const Center(child: CircularProgressIndicator());
                            // }),
                          ],
                        ),
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

  // void _resetPassword() {
  //   String password = _newPasswordController.text.trim();
  //   String confirmPassword = _confirmPasswordController.text.trim();
  //   if (password.isEmpty) {
  //     showCustomSnackBar('enter_password'.tr);
  //   } else if (password.length < 6) {
  //     showCustomSnackBar('password_should_be'.tr);
  //   } else if (password != confirmPassword) {
  //     showCustomSnackBar('password_does_not_matched'.tr);
  //   } else {
  //     if (widget.fromPasswordChange) {
  //       ProfileModel user = Get.find<AuthController>().profileModel!;
  //       Get.find<AuthController>().changePassword(user, password);
  //     } else {
  //       Get.find<AuthController>()
  //           .resetPassword(widget.resetToken, '+${widget.number!.trim()}',
  //               password, confirmPassword)
  //           .then((value) {
  //         if (value.isSuccess) {
  //           Get.find<AuthController>()
  //               .login('+${widget.number!.trim()}', password)
  //               .then((value) async {
  //             Get.offAllNamed(RouteHelper.getInitialRoute());
  //           });
  //         } else {
  //           showCustomSnackBar(value.message);
  //         }
  //       });
  //     }
  //   }
  // }
}
