import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/size/size.dart';

// ignore: must_be_immutable
class RegisterFormFeild extends StatelessWidget {
  RegisterFormFeild({
    super.key,
    required this.controller,
    required this.prefix,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.maxLine = 1,
    this.hintText,
    this.validator,
  });

  final TextEditingController controller;
  final IconData prefix;
  final String labelText;
  TextInputType keyboardType;
  final int maxLine;
  final String? hintText;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
        top: 8,
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 15,
            backgroundColor: Theme.of(context).primaryColorDark,
            child: Icon(
              prefix,
              color: Theme.of(context).primaryColor,
              size: 20,
            ),
          ),
          kwidth15,
          Expanded(
            child: TextFormField(
              maxLines: maxLine,
              keyboardType: keyboardType,
              style: GoogleFonts.poppins(
                  // color: kblack,
                  ),
              controller: controller,
              validator: validator,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.5,
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.5,
                  ),
                ),
                hintText: hintText,
                labelText: labelText,
                labelStyle: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
