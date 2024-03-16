import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerListWidget extends StatelessWidget {
  const DrawerListWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final IconData icon;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: IconTheme.of(context).color,
      ),
      title: Text(
        text,
        style: GoogleFonts.poppins(
          letterSpacing: 1,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
