import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/api/shared_service.dart';
import 'package:salesapp/constant/colors/colors.dart';
import 'package:salesapp/provider/auth_provider/login_provider.dart';
import 'package:salesapp/utils/utils.dart';
import 'package:salesapp/view/auth/profile_registration.dart';
import 'package:salesapp/view/auth/registration_screen.dart';
import 'package:salesapp/view/partner_bottom_nav/partner_bottom_nav.dart';
import 'package:country_picker/country_picker.dart';

import 'package:unique_identifier/unique_identifier.dart';

import 'provider/theme_provider.dart';
import 'view/auth/forgot_password.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  Country country = CountryParser.parseCountryCode('US');
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ThemeProvider>(context, listen: false).setTheme(false);
    });
  }

  void showPicker() {
    showCountryPicker(
        context: context,
        showPhoneCode: true,
        favorite: ['us'],
        countryListTheme: const CountryListThemeData(
            padding: EdgeInsets.zero,
            bottomSheetHeight: 450,
            inputDecoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: UnderlineInputBorder(),
            ),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            backgroundColor: kwhite),
        onSelect: (country) {
          setState(() {
            this.country = country;
          });
        });
  }

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  bool _passwordVisible = false;
  // bool _ischeck = false;
  // String selected = '';
  // bool readOnly = true;

  // List<String> deliverytype = [
  //   "Franchise",
  //   "Freelancer",
  // ];
  // String? drop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: Consumer<LoginProvider>(builder: (context, value, _) {
        return Form(
          key: globalKey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20).copyWith(top: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const SizedBox(
                    //   height: 10,
                    // ),

                    Container(
                      height: 150,
                      width: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage("assets/images/business-partner.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      // child: Column(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Image.asset(
                      //       "assets/images/food_stack.jpeg",
                      //       height: 20,
                      //       fit: BoxFit.fill,
                      //     ),
                      //     const SizedBox(
                      //       height: 20,
                      //     ),
                      //   ],
                      // ),
                    ),
                    const Text(
                      "SIGN IN",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: kblack,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      style: const TextStyle(
                        color: kblack,
                      ),
                      // readOnly: value.readOnly,
                      // onTap: () {
                      //   if (value.selectedPartnerType == null) {
                      //     value.setDropValue('');
                      //     partnerAlertDialog(context);
                      //   }
                      // },
                      cursorColor: lightOrange,
                      keyboardType: TextInputType.emailAddress,
                      controller: value.email,
                      decoration: InputDecoration(
                        counterText: "",
                        hintText: "Enter your Email",
                        prefixIcon: const Icon(
                          Icons.email_rounded,
                          // color: lightOrange,
                        ),
                        prefixIconColor: MaterialStateColor.resolveWith(
                          (states) => states.contains(MaterialState.focused)
                              ? lightOrange
                              : Colors.black.withOpacity(0.5),
                        ),
                        suffixIconColor: MaterialStateColor.resolveWith(
                          (states) => states.contains(MaterialState.focused)
                              ? lightOrange
                              : Colors.black.withOpacity(0.5),
                        ),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.6),
                        ),
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
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // IntlPhoneField(
                    //   pickerDialogStyle: PickerDialogStyle(
                    //     backgroundColor:whiteColor,
                    //   ),
                    //
                    //   showDropdownIcon: false,
                    //   cursorColor: deepColor,
                    //   decoration: InputDecoration(
                    //       counterText: "",
                    //       hintText: "Enter your phone number",
                    //       fillColor: Colors.grey.withOpacity(0.1),
                    //       filled: true,
                    //       hintStyle: TextStyle(
                    //           fontSize: 15,
                    //           fontWeight: FontWeight.w500,
                    //           color: Colors.black.withOpacity(0.6)),
                    //       border: UnderlineInputBorder(borderSide: BorderSide.none)),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      style: const TextStyle(
                        color: kblack,
                      ),
                      // readOnly: value.readOnly,
                      // onTap: () {
                      //   if (value.selectedPartnerType == null) {
                      //     value.setDropValue('');
                      //     partnerAlertDialog(context);
                      //   }
                      // },
                      cursorColor: lightOrange,
                      controller: value.password,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        counterText: "",
                        hintText: "Password",
                        prefixIcon: const Icon(
                          Icons.lock,
                          // color: lightOrange,
                        ),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          child: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        prefixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? lightOrange
                                : Colors.black.withOpacity(0.5)),
                        suffixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? lightOrange
                                : Colors.black.withOpacity(0.5)),
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.6),
                        ),
                        border: const UnderlineInputBorder(
                            borderSide: BorderSide.none),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "* Password Required";
                        }
                        return null;
                      },
                    ),
                    // if (value.selectedPartnerType == 'Franchise')
                    const SizedBox(
                      height: 10,
                    ),
                    // if (value.selectedPartnerType == 'Franchise')
                    TextFormField(
                      style: const TextStyle(
                        color: kblack,
                      ),
                      cursorColor: lightOrange,
                      controller: value.franchiseCode,
                      decoration: InputDecoration(
                        counterText: "",
                        hintText: "Franchise code",
                        prefixIcon: const Icon(
                          Icons.password,
                          // color: lightOrange,
                        ),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        prefixIconColor: MaterialStateColor.resolveWith(
                          (states) => states.contains(MaterialState.focused)
                              ? lightOrange
                              : Colors.black.withOpacity(0.5),
                        ),
                        suffixIconColor: MaterialStateColor.resolveWith(
                          (states) => states.contains(MaterialState.focused)
                              ? lightOrange
                              : Colors.black.withOpacity(0.5),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.6),
                        ),
                        border: const UnderlineInputBorder(
                            borderSide: BorderSide.none),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "* Franchise code Required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Expanded(
                        //   child: CheckboxListTile(
                        //       activeColor: lightOrange,
                        //       contentPadding: EdgeInsets.zero,
                        //       controlAffinity:
                        //           ListTileControlAffinity.leading,
                        //       title: const Text(
                        //         "Remember me",
                        //         style: TextStyle(
                        //           fontSize: 12,
                        //           fontWeight: FontWeight.w500,
                        //         ),
                        //       ),
                        //       value: _ischeck,
                        //       onChanged: (val) {
                        //         setState(() {
                        //           _ischeck = val!;
                        //         });
                        //       }),
                        // ),
                        TextButton(
                          onPressed: () {
                            // if (value.selectedPartnerType == null) {
                            //   value.setDropValue('');
                            //   partnerAlertDialog(context);
                            // } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgetPassScreen(
                                    // partnerType:
                                    //     value.selectedPartnerType ?? '',
                                    ),
                              ),
                            );
                            // }
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: lightOrange,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(
                          Size(value.isLoading ? 140 : 100, 40),
                        ),
                        backgroundColor: MaterialStatePropertyAll(lightOrange),
                      ),
                      onPressed: () async {
                        if (globalKey.currentState!.validate()) {
                          value.partnerLogin(
                            (val) async {
                              if (val) {
                                final loginResponse =
                                    await SharedService.loginDetails();

                                if (loginResponse?.partnerRegistered ?? false) {
                                  log('if register');
                                  // if (loginResponse?.partnerType ==
                                  //     'freelancer') {
                                  // ignore: use_build_context_synchronously
                                  // Navigator.pushReplacement(
                                  //   // ignore: use_build_context_synchronously
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         const DashboardPage(),
                                  //   ),
                                  // );
                                  // } else {
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushReplacement(
                                    // ignore: use_build_context_synchronously
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PartnerBottomNav(),
                                    ),
                                  );
                                  // }
                                } else {
                                  // log('else register');
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushReplacement(
                                    // ignore: use_build_context_synchronously
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegistrationPage(
                                        loginResponse: loginResponse,
                                      ),
                                    ),
                                  );
                                }
                              } else {
                                Utils.showToastMessage(
                                  context,
                                  'Invalid Email/Password/Code!',
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
                            "Sign In",
                            style: TextStyle(
                              // height: 55,
                              fontSize: 15,
                              color: kwhite,
                            ),
                          ),
                          value.isLoading
                              ? const Spacer()
                              : const SizedBox(width: 0),
                          value.isLoading
                              ? SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    backgroundColor: lightOrange,
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            kwhite),
                                  ),
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Join as a ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ProfileRegistration(),
                              ),
                            );
                          },
                          child: const Text(
                            "Partner",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kblack,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Future<dynamic> partnerAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: kwhite,
        content: const Text(
          'Please select a Partner Type',
          style: TextStyle(
            color: kblack,
          ),
        ),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(lightOrange),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: kwhite,
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(lightOrange),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Ok',
              style: TextStyle(
                color: kwhite,
              ),
            ),
          )
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Widget getAppSerialNo() {
    return FutureBuilder(
      future: UniqueIdentifier.serial,
      builder: (
        BuildContext context,
        AsyncSnapshot<String?> model,
      ) {
        if (model.hasData) {
          return Center(
            child: Text("Device ID : ${model.data!.toString()}"),
          );
        }

        return Container(
          padding: const EdgeInsets.all(10),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
