import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InsightDetails extends StatelessWidget {
  const InsightDetails({
    super.key,
    required this.count,
    required this.info,
  });
  final String count;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          count,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        Text(
          info,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
