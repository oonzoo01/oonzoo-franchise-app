import 'package:flutter/material.dart';
import 'package:salesapp/main.dart';
import 'package:salesapp/utils/language/language.dart';
import 'package:salesapp/utils/language/local_storage.dart';

class LagnuageUpdate extends StatefulWidget {
  const LagnuageUpdate({super.key});

  @override
  State<LagnuageUpdate> createState() => _LagnuageUpdateState();
}

class _LagnuageUpdateState extends State<LagnuageUpdate> {
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
      appBar: AppBar(
        title: Text(tr(context).language),
      ),
      body: Column(
        children: List.generate(
          Language.languageList().length,
          (index) => RadioListTile.adaptive(
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
      // Center(
      //     child: DropdownButton<Language>(
      //   items: Language.languageList()
      //       .map<DropdownMenuItem<Language>>((e) => DropdownMenuItem<Language>(
      //             value: e,
      //             child: Text(e.name),
      //           ))
      //       .toList(),
      //   onChanged: (Language? value) async {
      // if (value != null) {
      //   Locale _locale = await setLocale(value.languageCode);
      //   MyApp.setLocale(context, _locale);
      // }
      //   },
      // )
      // ),
    );
  }
}
