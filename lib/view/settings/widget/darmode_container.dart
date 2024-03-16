import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/provider/theme_provider.dart';

import '../../../constant/colors/colors.dart';

class DarkModeContainer extends StatelessWidget {
  const DarkModeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    return ListTile(
      title: Text(
        'Dark Mode',
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        'Experince an exciting dark mode',
        style: GoogleFonts.poppins(
          // color: Theme.of(context).primaryColor.withOpacity(0.5),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Transform.scale(
        scale: 0.7,
        child: CupertinoSwitch(
          thumbColor: IconTheme.of(context).color,
          activeColor: lightOrange,
          value: themeChange.isDarkMode,
          // value: false,
          onChanged: (bool value) {
            final provider = Provider.of<ThemeProvider>(context, listen: false);
            provider.setTheme(value);
          },
        ),
      ),
    );
  }
}
