import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salesapp/model/login_response.dart';
import 'package:salesapp/view/widget/custom_bottombar.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:unique_identifier/unique_identifier.dart';

import '../../constant/size/size.dart';
import '../widget/onboard_appbar.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({
    super.key,
    required this.email,
  });
  final String email;

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController paswrdController = TextEditingController();
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  LoginResponse? userModel;

  @override
  void initState() {
    super.initState();
    userModel = LoginResponse();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.email);
    return Scaffold(
      key: _scaffoldKey,
      appBar: const OnBoardAppbar(headText: 'Verification'),
      body: ProgressHUD(
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
        key: UniqueKey(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Form(
            key: globalFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Enter your Password',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                kheight30,
                TextFormField(
                  obscureText: hidePassword,
                  style: GoogleFonts.poppins(),
                  controller: paswrdController,
                  decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        // color: kblack.withOpacity(0.5),
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      icon: hidePassword
                          ? Icon(
                              Icons.visibility_off,
                              color: IconTheme.of(context).color,
                            )
                          : Icon(
                              Icons.visibility,
                              color: IconTheme.of(context).color,
                            ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        // color: kblack.withOpacity(0.5),
                      ),
                    ),
                    labelText: 'ENTER YOUR PASSWORD',
                    labelStyle: GoogleFonts.poppins(
                      // color: kblack.withOpacity(0.5),
                      fontSize: 16,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password can\'t be empty.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                getAppSerialNo(),
                const SizedBox(height: 50),
                const Center(
                    child: Text(
                  'Version 1.0.12 + 21',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        onTap: () {
          if (validateAndSave()) {
            setState(() {
              isApiCallProcess = true;
            });

            // APIService.salesmanLogin(widget.email, paswrdController.text)
            //     .then((response) {
            //   print(response);

            //   setState(() {
            //     isApiCallProcess = false;
            //   });

            //   if (response) {
            //     navigatorKey.currentState!.pushAndRemoveUntil(
            //       MaterialPageRoute(
            //         builder: (context) => const DashboardPage(),
            //       ),
            //       (Route<dynamic> route) => false,
            //     );
            //   } else {
            //     FormHelper.showSimpleAlertDialog(
            //       context,
            //       Config.appName,
            //       "Invalid Username/Password!",
            //       "Ok",
            //       () {
            //         Navigator.of(context).pop();
            //       },
            //     );
            //   }
            // });
          }
        },
        text: 'Continue',
      ),
      // bottomNavigationBar: CustomBottomBar(
      //   text: 'Continue',
      //   // onTap: () => Navigator.of(context).pushAndRemoveUntil(
      //   //     MaterialPageRoute<HomeScreen>(
      //   //       builder: (BuildContext context) => const HomeScreen(),
      //   //     ),
      //   //     (Route<dynamic> route) => false),
      // ),
    );
  }

  Widget loginUISetup() {
    return SingleChildScrollView(
      child: Form(
        key: globalFormKey,
        child: _loginUI(context),
      ),
    );
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

  _loginUI(BuildContext context) {
    Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Form(
        key: globalFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Enter your Password',
              style: GoogleFonts.poppins(
                // color: kblack,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            kheight30,
            TextFormField(
              obscureText: hidePassword,
              style: GoogleFonts.poppins(
                  // color: kblack,
                  ),
              controller: paswrdController,
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.5,
                    // color: kblack.withOpacity(0.5),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  icon: hidePassword
                      ? Icon(
                          Icons.visibility_off,
                          color: IconTheme.of(context).color,
                        )
                      : Icon(
                          Icons.visibility,
                          color: IconTheme.of(context).color,
                        ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.5,
                    // color: kblack.withOpacity(0.5),
                  ),
                ),
                labelText: 'ENTER YOUR PASSWORD',
                labelStyle: GoogleFonts.poppins(
                  // color: kblack.withOpacity(0.5),
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}



// TextFormField otpForm(TextEditingController otpController) {
//   return TextFormField(
//     keyboardType: TextInputType.number,
//     style: GoogleFonts.poppins(
//       color: kblack,
//     ),
//     controller: otpController,
//     decoration: InputDecoration(
//       enabledBorder: UnderlineInputBorder(
//         borderSide: BorderSide(
//           width: 0.5,
//           color: kblack.withOpacity(0.5),
//         ),
//       ),
//       suffixIcon: IconButton(
//         onPressed: () {
//           setState(() {
//             isVisible ? isVisible = false : isVisible = true;
//           });
//         },
//         icon: isVisible
//             ? const Icon(
//                 Icons.remove_red_eye,
//                 color: lightOrange,
//               )
//             : const Icon(
//                 Icons.visibility_off,
//                 color: lightOrange,
//               ),
//       ),
//       focusedBorder: UnderlineInputBorder(
//         borderSide: BorderSide(
//           width: 0.5,
//           color: kblack.withOpacity(0.5),
//         ),
//       ),
//       labelText: 'ENTER YOUR PASSWORD',
//       labelStyle: GoogleFonts.poppins(
//         color: kblack.withOpacity(0.5),
//         fontSize: 16,
//       ),
//     ),
//   );
// }
