// check/see the fonts
// create themes
//create theme enable button

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData();

  static final dartTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF191414),
    backgroundColor: const Color(0xFF191414),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF191414),
      secondary: Color(0xFF1DB954),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: TextTheme(
      headline2: TextStyle(
        fontSize: 35.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.0,
        fontFamily: "myfont",
      ),
      headline4: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.0,
        fontFamily: "myfont",
      ),
      bodyText1: TextStyle(
        fontSize: 17.0,
        color: Colors.grey[300],
        fontWeight: FontWeight.w400,
        letterSpacing: 1.0,
        fontFamily: "myfont",
      ),
      bodyText2: TextStyle(
        fontFamily: "myfont",
        color: Colors.grey[400],
        fontWeight: FontWeight.w700,
        overflow: TextOverflow.ellipsis,
      ),
    ),
  );
}
