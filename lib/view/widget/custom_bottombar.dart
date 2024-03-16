import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/colors/colors.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
    required this.onTap,
    required this.text,
  });
  final Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: lightOrange,
          height: 60,
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                letterSpacing: 1,
                color: kwhite,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
