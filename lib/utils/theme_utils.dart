import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salesapp/constant/colors/colors.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class MyTheme {
  //! Light Theme
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: HexColor("#EFEFEF"),
    dividerColor: Colors.black,
    primaryColor: kwhite,
    primaryColorDark: kblack,
    useMaterial3: false,
    // disabledColor: kblack,
    // secondaryHeaderColor: kblac,
    // disabledColor: ,
    focusColor: korange,

    colorScheme: const ColorScheme.light(),
    appBarTheme: AppBarTheme(
      backgroundColor: kwhite,
      foregroundColor: kblack,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: lightOrange,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),
    primaryIconTheme: const IconThemeData(
      color: Colors.black,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll(kwhite),
        backgroundColor: MaterialStatePropertyAll(kwhite),
      ),
    ),
  );

  //! Dark Theme
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    dividerColor: Colors.black,
    useMaterial3: false,
    primaryColor: kblack,
    primaryColorDark: kwhite,
    disabledColor: Colors.black54,
    cardColor: kwhite,
    colorScheme: const ColorScheme.dark(),
    primaryIconTheme: const IconThemeData(
      color: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: kblack,
      foregroundColor: kwhite,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: kblack,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );
}
