import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPoppinsText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLine;
  final FontWeight? fontWeight;
  final double? wordSpacing;
  final TextDecoration? textDecoration;
  final FontStyle? fontStyle;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThickness;

  const CustomPoppinsText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.textAlign,
    this.textOverflow,
    this.maxLine,
    this.fontWeight,
    this.wordSpacing,
    this.textDecoration,
    this.fontStyle,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: GoogleFonts.poppins(
          color: color,
          wordSpacing: wordSpacing,
          fontSize: fontSize,
          decoration: textDecoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          fontWeight: fontWeight,
          decorationThickness: decorationThickness,
          fontStyle: fontStyle),
      maxLines: maxLine,
      overflow: textOverflow,
      textAlign: textAlign,
    );
  }
}
