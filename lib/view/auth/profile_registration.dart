import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/constant/colors/colors.dart';
import 'package:salesapp/utils/utils.dart';

import '../../provider/auth_provider/register_provider.dart';
import '../../utils/country_phone_field/intl_phone_field.dart';
import 'verification_screen.dart';

class ProfileRegistration extends StatefulWidget {
  const ProfileRegistration({super.key});

  @override
  State<ProfileRegistration> createState() => _ProfileRegistrationState();
}

class _ProfileRegistrationState extends State<ProfileRegistration> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  // static List<String> deliverytype = [
  //   "Franchise",
  //   "Freelancer",
  // ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<RegisterProvider>(context, listen: false).clearAllForm();
        Provider.of<RegisterProvider>(context, listen: false)
            .clearAllRegistorForm();
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(lightOrange),
              ),
              onPressed: () async {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const VerificationScreen(
                //       number: "email.text",
                //       isForgot: false,
                //     ),
                //   ),
                // );
                if (globalKey.currentState!.validate()) {
                  // if (Provider.of<RegisterProvider>(context, listen: false)
                  //         .deliverymanimage ==
                  //     null) {
                  //   _showdialogbox();
                  // }
                  // if (Provider.of<RegisterProvider>(context, listen: false)
                  //         .deliverymanimage !=
                  //     null) {
                  // if (Provider.of<RegisterProvider>(context, listen: false)
                  //         .selectedPartnerType !=
                  //     null) {
                  Provider.of<RegisterProvider>(context, listen: false)
                      .parterSignUp(
                    context,
                    (val) {
                      if (val != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerificationScreen(
                              number: Provider.of<RegisterProvider>(context)
                                  .email
                                  .text,
                              isForgot: false,
                            ),
                          ),
                        );
                      } else {
                        Utils.showToastMessage(
                          context,
                          "Email already Registered",
                          isError: true,
                          position: StyledToastPosition.top,
                        );
                      }
                    },
                  );
                  // } else {
                  //   Utils.showToastMessage(
                  //     context,
                  //     "Please Select Partner Type",
                  //     isError: true,
                  //     position: StyledToastPosition.top,
                  //   );
                  // }

                  // }
                }

                //   }
                // }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (Provider.of<RegisterProvider>(context, listen: false)
                      .isLoading)
                    const Spacer(),
                  const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 15,
                      color: kwhite,
                    ),
                  ),
                  if (Provider.of<RegisterProvider>(context, listen: false)
                      .isLoading)
                    const Spacer(),
                  if (Provider.of<RegisterProvider>(context, listen: false)
                      .isLoading)
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        backgroundColor: lightOrange,
                        valueColor: const AlwaysStoppedAnimation<Color>(kwhite),
                      ),
                    )
                ],
              ),
            )
            // CustomButton1(
            //   onTap: () {
            // if (_globalKey.currentState!.validate()) {
            //   if (Provider.of<authProvider>(context, listen: false)
            //           .deliverymanimage ==
            //       null) {
            //     _showdialogbox();
            //   } else {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const RegistrationPage()));
            //   }
            // }
            //   },
            //   text: 'Next',
            //   height: 55,
            //   textsize: 15,
            // ),
            ),
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: kwhite,
          elevation: 1,
          automaticallyImplyLeading: false,
          leading: IconButton(
            color: kblack,
            onPressed: () {
              Provider.of<RegisterProvider>(context, listen: false)
                  .clearAllForm();
              Provider.of<RegisterProvider>(context, listen: false)
                  .clearAllRegistorForm();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          centerTitle: true,
          title: const Text(
            "Partner Registration",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: kblack,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Consumer<RegisterProvider>(builder: (context, value, child) {
              return Form(
                key: globalKey,
                child: Column(
                  children: [
                    const Text(
                      "Complete the registration process to serve as a partner person on this platform",
                      style: TextStyle(
                        fontSize: 12,
                        color: kblack,
                      ),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    LinearProgressIndicator(
                      backgroundColor: Colors.grey,
                      value: 0.33,
                      minHeight: 3,
                      color: lightOrange,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // if (value.deliverymanimage != null)
                    //   Stack(
                    //     children: [
                    //       Container(
                    //         width: ResponsiveRatio().width(context, 0.15),
                    //         height: ResponsiveRatio().width(context, 0.15),
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(10),
                    //           image: DecorationImage(
                    //               image: FileImage(value.deliverymanimage!),
                    //               fit: BoxFit.fill),
                    //         ),
                    //       ),
                    //       Positioned(
                    //         bottom: 10,
                    //         right: 10,
                    //         child: InkWell(
                    //           onTap: () {
                    //             value.removedeliverymanimage();
                    //           },
                    //           child: Container(
                    //             decoration: const BoxDecoration(
                    //                 shape: BoxShape.circle, color: kwhite),
                    //             child: const Padding(
                    //               padding: EdgeInsets.all(4),
                    //               child: Icon(
                    //                 Icons.delete_outline,
                    //                 color: Colors.red,
                    //                 size: 20,
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   )
                    // else
                    //   InkWell(
                    //     onTap: () {
                    //       showDialog(
                    //           context: context,
                    //           builder: (context) {
                    //             return AlertDialog(
                    //               backgroundColor: kwhite,
                    //               shape: RoundedRectangleBorder(
                    //                   borderRadius: BorderRadius.circular(15)),
                    //               titlePadding: EdgeInsets.zero,
                    //               title: Column(
                    //                 children: [
                    //                   const SizedBox(
                    //                     height: 15,
                    //                   ),
                    //                   const Text(
                    //                     "Select Profile Picture",
                    //                     style: TextStyle(
                    //                       fontSize: 18,
                    //                       fontWeight: FontWeight.w500,
                    //                     ),
                    //                   ),
                    //                   const SizedBox(
                    //                     height: 15,
                    //                   ),
                    //                   Row(
                    //                     mainAxisAlignment:
                    //                         MainAxisAlignment.spaceBetween,
                    //                     children: [
                    //                       Expanded(
                    //                         child: InkWell(
                    //                           onTap: () async {
                    //                             await value
                    //                                 .pickdeliverymanImage(
                    //                                     ImageSource.gallery);
                    //                             Navigator.pop(context);
                    //                           },
                    //                           child: Container(
                    //                             alignment: Alignment.center,
                    //                             decoration: BoxDecoration(
                    //                               color: Colors.grey
                    //                                   .withOpacity(0.2),
                    //                               borderRadius:
                    //                                   const BorderRadius.only(
                    //                                 bottomLeft:
                    //                                     Radius.circular(15),
                    //                               ),
                    //                             ),
                    //                             child: const Padding(
                    //                               padding: EdgeInsets.all(8.0),
                    //                               child: Text(
                    //                                 "GALLARY",
                    //                                 style: TextStyle(
                    //                                   fontSize: 14,
                    //                                   fontWeight:
                    //                                       FontWeight.bold,
                    //                                 ),
                    //                               ),
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                       Expanded(
                    //                         child: InkWell(
                    //                           onTap: () async {
                    //                             await value
                    //                                 .pickdeliverymanImage(
                    //                                     ImageSource.camera);
                    //                             Navigator.pop(context);
                    //                           },
                    //                           child: Container(
                    //                             decoration: const BoxDecoration(
                    //                               color: kblack,
                    //                               borderRadius:
                    //                                   BorderRadius.only(
                    //                                 bottomRight:
                    //                                     Radius.circular(15),
                    //                               ),
                    //                             ),
                    //                             alignment: Alignment.center,
                    //                             child: const Padding(
                    //                               padding: EdgeInsets.all(8.0),
                    //                               child: Text(
                    //                                 "CAMERA",
                    //                                 style: TextStyle(
                    //                                   fontSize: 14,
                    //                                   fontWeight:
                    //                                       FontWeight.bold,
                    //                                   color: kwhite,
                    //                                 ),
                    //                               ),
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       )
                    //                     ],
                    //                   )
                    //                 ],
                    //               ),
                    //             );
                    //           });
                    //     },
                    //     child: SizedBox(
                    //       width: ResponsiveRatio().width(context, 0.15),
                    //       height: ResponsiveRatio().width(context, 0.15),
                    //       child: DottedBorder(
                    //         radius: const Radius.circular(10),
                    //         dashPattern: const [10, 3],
                    //         color: lightOrange,
                    //         borderType: BorderType.RRect,
                    //         child: Center(
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(15),
                    //             child: Column(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               children: [
                    //                 Icon(
                    //                   Icons.camera_alt_rounded,
                    //                   size: 35,
                    //                   color: Colors.black.withOpacity(0.4),
                    //                 ),
                    //                 const SizedBox(
                    //                   height: 6,
                    //                 ),
                    //                 Text(
                    //                   "Upload photo",
                    //                   style: TextStyle(
                    //                     fontWeight: FontWeight.w600,
                    //                     color: Colors.black.withOpacity(0.6),
                    //                     fontSize: 12,
                    //                   ),
                    //                   textAlign: TextAlign.center,
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: const TextStyle(
                              color: kblack,
                            ),
                            cursorColor: lightOrange,
                            controller: value.firstName,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Enter Name',
                              hintStyle: const TextStyle(
                                color: kblack,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: lightOrange.withOpacity(0.4)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: lightOrange, width: 2)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: kred)),
                              prefixIcon: const Icon(
                                Icons.person,
                                size: 20,
                              ),
                              prefixIconColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      states.contains(MaterialState.focused)
                                          ? lightOrange
                                          : Colors.black.withOpacity(0.5)),
                            ),
                            validator: (val) {
                              if (val!.trim().isEmpty) {
                                return "* Name Required";
                              }

                              return null;
                            },
                          ),
                        ),
                        // const SizedBox(
                        //   width: 20,
                        // ),
                        // Expanded(
                        //   child: TextFormField(
                        //     keyboardType: TextInputType.name,
                        //     controller: value.lastName,
                        //     cursorColor: lightOrange,
                        //     decoration: InputDecoration(
                        //       isDense: true,
                        //       hintText: 'Last name',
                        //       enabledBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(10),
                        //         borderSide: BorderSide(
                        //           color: lightOrange.withOpacity(0.4),
                        //         ),
                        //       ),
                        //       focusedBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(10),
                        //         borderSide:
                        //             BorderSide(color: lightOrange, width: 2),
                        //       ),
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(10),
                        //       ),
                        //       prefixIcon: const Icon(
                        //         Icons.person,
                        //         size: 20,
                        //       ),
                        //       prefixIconColor: MaterialStateColor.resolveWith(
                        //         (states) => states.contains(MaterialState.focused)
                        //             ? lightOrange
                        //             : Colors.black.withOpacity(0.5),
                        //       ),
                        //     ),
                        //     // validator: (val) {
                        //     //   if (val!.isEmpty) {
                        //     //     return "* Last Name Required";
                        //     //   }
                        //     //   return null;
                        //     // },
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // TextFormField(
                    //   cursorColor: lightOrange,
                    //   keyboardType: TextInputType.number,
                    //   controller: value.phoneNumber,
                    //   style: const TextStyle(
                    //     color: kblack,
                    //   ),
                    // decoration: InputDecoration(
                    //   isDense: true,
                    //   counterText: "",
                    //   hintText: "Enter your phone number",
                    //   prefixIcon: const CountryCodePicker(
                    //     textStyle: TextStyle(
                    //       color: kblack,
                    //     ),
                    //     backgroundColor: kwhite,
                    //     searchStyle: TextStyle(
                    //       color: kblack,
                    //     ),
                    //     closeIcon: Icon(Icons.close, color: kblack),
                    //     // searchDecoration: InputDecoration(
                    //     //     iconColor: kblack,
                    //     //     hintStyle: TextStyle(color: Colors.grey.shade300),
                    //     //     prefixIcon: Icon(Icons.search)),
                    //     dialogTextStyle: TextStyle(
                    //       color: kblack,
                    //     ),
                    //     padding: EdgeInsets.zero,
                    //     // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                    //     initialSelection: 'AE',
                    //     favorite: ['+971', 'AE'],

                    //     // optional. Shows only country name and flag
                    //     showCountryOnly: false,
                    //     // optional. Shows only country name and flag when popup is closed.
                    //     showOnlyCountryWhenClosed: false,
                    //     // optional. aligns the flag and the Text left
                    //   ),
                    //   hintStyle: TextStyle(
                    //     fontSize: 15,
                    //     fontWeight: FontWeight.w500,
                    //     color: Colors.black.withOpacity(0.6),
                    //   ),
                    //   enabledBorder: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(10),
                    //     borderSide: BorderSide(
                    //       color: lightOrange.withOpacity(0.4),
                    //     ),
                    //   ),
                    //   focusedBorder: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(10),
                    //     borderSide: BorderSide(color: lightOrange, width: 2),
                    //   ),
                    //   border: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(10),
                    //     borderSide: const BorderSide(color: kred),
                    //   ),
                    // ),
                    //   validator: (val) {
                    //     if (val!.isEmpty) {
                    //       return "* Phone Number Required";
                    //     }
                    //     return null;
                    //   },
                    // ),
                    IntlPhoneField(
                      controller: value.phoneNumber,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isDense: true,
                        counterText: "",
                        hintText: "Enter your phone number",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: lightOrange.withOpacity(0.4),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: lightOrange, width: 2),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: kred),
                        ),
                      ),
                      initialCountryCode: value.countryCode ?? 'AE',
                      // initialCountryCode: "+971",
                      languageCode: "en",
                      onChanged: (phone) {},
                      onCountryChanged: (country) {
                        value.setCountryCode(country.dialCode);
                      },
                    ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // DropdownButtonHideUnderline(
                    //   child: DropdownButton2<String>(
                    //     hint: const Text(
                    //       'Select type',
                    //       style: TextStyle(
                    //         fontSize: 12,
                    //         fontWeight: FontWeight.w500,
                    //         color: Colors.black,
                    //       ),
                    //     ),
                    //     items: deliverytype
                    //         .map(
                    //           (String item) => DropdownMenuItem<String>(
                    //             value: item,
                    //             child: Text(
                    //               item,
                    //               style: const TextStyle(
                    //                 fontSize: 12,
                    //                 fontWeight: FontWeight.w500,
                    //               ),
                    //             ),
                    //           ),
                    //         )
                    //         .toList(),
                    //     value: value.selectedPartnerType,
                    //     onChanged: (String? val) {
                    //       value.setPartnerType(val);
                    //     },
                    //     buttonStyleData: ButtonStyleData(
                    //       height: 50,
                    //       width: double.infinity,
                    //       padding: const EdgeInsets.only(left: 5, right: 5),
                    //       decoration: BoxDecoration(
                    //         color: Colors.grey.shade100,
                    //         borderRadius: BorderRadius.circular(10),
                    //         border: Border.all(
                    //           color: lightOrange,
                    //         ),
                    //       ),
                    //     ),
                    //     style: const TextStyle(
                    //       color: kblack,
                    //     ),
                    //     iconStyleData: const IconStyleData(
                    //       icon: Icon(
                    //         Icons.arrow_drop_down,
                    //         color: kblack,
                    //       ),
                    //       iconSize: 25,
                    //     ),
                    //     dropdownStyleData: DropdownStyleData(
                    //       maxHeight: 200,
                    //       decoration: BoxDecoration(
                    //         color: kwhite,
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       offset: const Offset(0, -6),
                    //       scrollbarTheme: ScrollbarThemeData(
                    //         radius: const Radius.circular(40),
                    //         thickness: MaterialStateProperty.all<double>(6),
                    //         thumbVisibility:
                    //             MaterialStateProperty.all<bool>(true),
                    //       ),
                    //     ),
                    //     menuItemStyleData: const MenuItemStyleData(
                    //       height: 40,
                    //       padding: EdgeInsets.only(left: 10, right: 10),
                    //     ),
                    //   ),
                    // ),
                    // if (value.selectedPartnerType == 'Franchise')
                    //   const SizedBox(
                    //     height: 15,
                    //   ),
                    // if (value.selectedPartnerType == 'Franchise')
                    //   TextFormField(
                    //     controller: value.franchiseCode,
                    //     decoration: InputDecoration(
                    //       prefixIcon: const Icon(
                    //         Icons.password,
                    //       ),
                    //       prefixIconColor: MaterialStateColor.resolveWith(
                    //           (states) => states.contains(MaterialState.focused)
                    //               ? lightOrange
                    //               : Colors.black.withOpacity(0.5)),
                    //       isDense: true,
                    //       hintText: "Franchise Code",
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: lightOrange),
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       enabledBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //         borderSide:
                    //             BorderSide(color: lightOrange.withOpacity(0.4)),
                    //       ),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //     ),
                    //   ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      style: const TextStyle(
                        color: kblack,
                      ),
                      cursorColor: lightOrange,
                      controller: value.email,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Email',
                        hintStyle: const TextStyle(
                          color: kblack,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: lightOrange.withOpacity(0.4),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: lightOrange, width: 2),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: kred),
                        ),
                        prefixIcon: const Icon(
                          Icons.email,
                          size: 20,
                        ),
                        prefixIconColor: MaterialStateColor.resolveWith(
                          (states) => states.contains(MaterialState.focused)
                              ? lightOrange
                              : Colors.black.withOpacity(0.5),
                        ),
                      ),
                      validator: (val) {
                        final email = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (val!.isEmpty) {
                          return "* Email Required";
                        }
                        if (!email.hasMatch(val)) {
                          return 'Invalid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      style: const TextStyle(
                        color: kblack,
                      ),
                      cursorColor: lightOrange,
                      controller: value.passwordController,
                      obscureText: value.passwordVisible,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          color: kblack,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            value.setPasswordObscureText();
                          },
                          child: Icon(
                            !value.passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: lightOrange.withOpacity(0.4)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: lightOrange, width: 2)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: kred),
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                          size: 20,
                        ),
                        suffixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? lightOrange
                                : Colors.black.withOpacity(0.5)),
                        prefixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? lightOrange
                                : Colors.black.withOpacity(0.5)),
                      ),
                      validator: (val) {
                        return value.isPasswordValid(val ?? '');
                        // if (val!.isEmpty) {
                        //   return "* Password Required";
                        // }
                        // return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      style: const TextStyle(
                        color: kblack,
                      ),
                      obscureText: value.confirmpassword,
                      cursorColor: lightOrange,
                      controller: value.confirmPasswordController,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: "Confirm Password",
                        hintStyle: const TextStyle(
                          color: kblack,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            value.setConfirmpasswordObscureText();
                          },
                          child: Icon(
                            !value.confirmpassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: lightOrange.withOpacity(0.4)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: lightOrange, width: 2)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: kred)),
                        prefixIcon: const Icon(
                          Icons.lock,
                          size: 20,
                        ),
                        suffixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? lightOrange
                                : Colors.black.withOpacity(0.5)),
                        prefixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? lightOrange
                                : Colors.black.withOpacity(0.5)),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "* Confirm Password Required";
                        }
                        if (val.trim() !=
                            value.passwordController.text.trim()) {
                          return "Invalid Confirm Password";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
