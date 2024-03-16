import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salesapp/constant/colors/colors.dart';
import 'package:salesapp/view/password/password.dart';

import '../../../constant/size/size.dart';

class CustomNumberbottomBar extends StatelessWidget {
  CustomNumberbottomBar({super.key});
  final TextEditingController idController = TextEditingController();
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context),
      color: kwhite,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: globalFormKey,
          child: Row(
            children: <Widget>[
              kwidth5,
              Expanded(
                child: TextFormField(
                  style: const TextStyle(
                    color: kblack,
                  ),
                  keyboardType: TextInputType.number,
                  controller: idController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter MobileNumber',
                    hintStyle: GoogleFonts.poppins(
                      color: kblack,
                      fontSize: 14,
                    ),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Number can\'t be empty.';
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: lightOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  if (globalFormKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute<PasswordScreen>(
                        builder: (BuildContext context) => PasswordScreen(
                          email: idController.text,
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  'Continue',
                  style: GoogleFonts.poppins(
                    letterSpacing: 1,
                    color: kwhite,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
