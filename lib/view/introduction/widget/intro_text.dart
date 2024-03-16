import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroText extends StatelessWidget {
  const IntroText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Setup almost Every ',
          style: GoogleFonts.poppins(
            letterSpacing: 1,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Business.',
          style: GoogleFonts.poppins(
            letterSpacing: 1,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
