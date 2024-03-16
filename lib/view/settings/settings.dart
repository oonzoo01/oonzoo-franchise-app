import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/provider/theme_provider.dart';

import '../../constant/colors/colors.dart';
import '../../constant/size/size.dart';
import '../../main.dart';
import '../../utils/language/language.dart';
import '../../utils/language/local_storage.dart';
import 'widget/darmode_container.dart';

enum Languages {
  English,
  Arabi,
  Hindi,
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? groupValue;
  @override
  void initState() {
    getLocale().then((value) {
      setState(() {
        groupValue = value.toString();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeProvider>(
                context,
              ).theme ==
              ThemeMode.light
          ? kwhite
          : null,
      // drawer: const SDNavigationDrawer(),
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          tr(context).settings,
          style: const TextStyle(),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 20,
            ),
            child: Text(
              tr(context).display_settings,
              style: GoogleFonts.poppins(
                // color: kblack.withOpacity(0.5),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          kheight20,
          const DarkModeContainer(),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 20,
            ),
            child: Text(
              '${tr(context).select} ${tr(context).language}',
              style: GoogleFonts.poppins(
                // color: kblack.withOpacity(0.5),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          kheight20,
          Padding(
            padding: const EdgeInsets.symmetric(
                // vertical: 3,
                ),
            child: Container(
              // color: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                // vertical: 10,
              ),
              child: Column(
                children: List.generate(
                  Language.languageList().length,
                  (index) => RadioListTile.adaptive(
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: Text(Language.languageList()[index].name),
                    value: Language.languageList()[index].languageCode,
                    groupValue: groupValue ?? 'en',
                    onChanged: (value) async {
                      if (value != null) {
                        setState(() {
                          groupValue = value;
                        });
                        Locale locale = await setLocale(value);
                        MyApp.setLocale(context, locale);
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
