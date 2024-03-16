import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    required this.mainAxisAlignment,
    this.widthFactor = 4.6,
  });

  final MainAxisAlignment mainAxisAlignment;
  final double widthFactor;

  @override
  Widget build(BuildContext context) {
    // final double w = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: mainAxisAlignment,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/images/business-partner.png',
            fit: BoxFit.cover,
            width: 250,
          ),
        ),
        // Text(
        //   appName,
        //   style: GoogleFonts.poppins(
        //     letterSpacing: 1.5,
        //     fontSize: 26,
        //     fontWeight: FontWeight.w600,
        //   ),
        // ),
      ],
    );
  }
}
