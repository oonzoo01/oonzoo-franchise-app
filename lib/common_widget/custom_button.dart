import 'package:flutter/material.dart';
import 'package:salesapp/constant/colors/colors.dart';

import 'custom_poppins.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.color = Colors.orange,
    this.textColor = Colors.white,
    this.borcolr = const Color.fromRGBO(0, 0, 0, 1),
    this.width = double.infinity,
    required this.height,
    required this.textsize,
    this.radius = 5,
    this.isLoading = false,
  });

  final Function()? onTap;
  final String text;
  final Color borcolr;
  final Color color;
  final double textsize;
  final Color textColor;
  final double height;
  final double width;
  final double radius;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height),
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPoppinsText(
            fontSize: textsize,
            fontWeight: FontWeight.w600,
            text: text,
            color: textColor,
          ),
          if (isLoading) const SizedBox(width: 20),
          if (isLoading)
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                backgroundColor: lightOrange,
                valueColor: const AlwaysStoppedAnimation<Color>(kwhite),
              ),
            )
        ],
      ),
    );
  }
}
