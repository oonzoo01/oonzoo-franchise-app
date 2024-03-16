import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/constant/colors/colors.dart';
import 'package:salesapp/provider/auth_provider/register_provider.dart';
import 'package:salesapp/utils/utils.dart';

import '../../common_widget/custom_button.dart';
import '../../common_widget/custom_poppins.dart';
import '../../provider/theme_provider.dart';
import '../../utils/language/local_storage.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  bool _newpassword = true;
  bool _confirmpassword = true;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.black.withOpacity(0.4)),
        iconTheme: const IconThemeData(color: kwhite),
        title: CustomPoppinsText(
          text: tr(context).change_password,
          color: kwhite,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _globalKey,
            child: Consumer<RegisterProvider>(builder: (context, model, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomPoppinsText(
                    text: tr(context).create_new_password,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: model.oldPassword,
                    obscureText: _newpassword,
                    cursorColor: lightOrange,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: tr(context).enter_old_password,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _newpassword = !_newpassword;
                          });
                        },
                        child: Icon(_newpassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: lightOrange.withOpacity(0.4)),
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
                        Icons.lock,
                        size: 20,
                      ),
                      suffixIconColor: MaterialStateColor.resolveWith(
                        (states) => states.contains(MaterialState.focused)
                            ? lightOrange
                            : themeChange.theme == ThemeMode.light
                                ? Colors.black.withOpacity(0.5)
                                : kwhite,
                      ),
                      prefixIconColor: MaterialStateColor.resolveWith(
                        (states) => states.contains(MaterialState.focused)
                            ? lightOrange
                            : themeChange.theme == ThemeMode.light
                                ? Colors.black.withOpacity(0.5)
                                : kwhite,
                      ),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "*${tr(context).password_required}";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: model.passwordController,
                    obscureText: _confirmpassword,
                    cursorColor: lightOrange,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: tr(context).enter_new_password,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _confirmpassword = !_confirmpassword;
                          });
                        },
                        child: Icon(
                          _confirmpassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
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
                        Icons.lock,
                        size: 20,
                      ),
                      suffixIconColor: MaterialStateColor.resolveWith(
                          (states) => states.contains(MaterialState.focused)
                              ? lightOrange
                              : themeChange.theme == ThemeMode.light
                                  ? Colors.black.withOpacity(0.5)
                                  : kwhite),
                      prefixIconColor: MaterialStateColor.resolveWith(
                          (states) => states.contains(MaterialState.focused)
                              ? lightOrange
                              : themeChange.theme == ThemeMode.light
                                  ? Colors.black.withOpacity(0.5)
                                  : kwhite),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "*${tr(context).confirm_password_required}";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    isLoading: model.isLoading,
                    onTap: () {
                      if (_globalKey.currentState!.validate()) {
                        model.partnerChangePassword(
                          (val) {
                            if (val != null) {
                              Utils.showToastMessage(
                                context,
                                val,
                                position: StyledToastPosition.top,
                              );
                              Navigator.pop(context);
                            } else {
                              Utils.showToastMessage(
                                context,
                                tr(context).something_went_wrong,
                                isError: true,
                                position: StyledToastPosition.top,
                              );
                            }
                          },
                        );
                      }
                    },
                    text: tr(context).change_password,
                    height: 50,
                    textsize: 15,
                    color: Colors.deepOrange,
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
