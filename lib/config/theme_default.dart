import 'package:flutter/material.dart';

ThemeData themeDefault() {
  return ThemeData(
    primaryColor: Colors.pink,
    primarySwatch: Colors.pink,
    // primaryColorDark: Colors.black,
    // primaryColorLight: Colors.white,
    // accentColor: const Color(0xFFE84545),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    backgroundColor: const Color(0xFFF4F4F4),
    iconTheme: const IconThemeData(color: Colors.pink),
    bottomAppBarColor: Colors.grey,

    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),

    fontFamily: 'Optima',
/*
    textTheme: const TextTheme(
      headline1: TextStyle(
        // color: Color(0xFF2B2E4A),
        fontWeight: FontWeight.bold,
        // fontSize: 36,
      ),
      headline2: TextStyle(
        // color: Color(0xFF2B2E4A),
        // fontWeight: FontWeight.bold,
        // fontSize: 24,
      ),
      headline3: TextStyle(
        color: Color(0xFF2B2E4A),
        fontWeight: FontWeight.bold,
        // fontSize: 18,
      ),
      headline4: TextStyle(
        color: Color(0xFF2B2E4A),
        fontWeight: FontWeight.bold,
        // fontSize: 16,
      ),
      headline5: TextStyle(
        color: Color(0xFFE4E6F1),
        fontWeight: FontWeight.normal,
        // fontSize: 25,
      ),
      headline6: TextStyle(
        color: Color(0xFFE4E6F1),
        fontWeight: FontWeight.normal,
        // fontSize: 20,
      ),
      bodyText1: TextStyle(
        color: Color(0xFF2B2E4A),
        fontWeight: FontWeight.normal,
        // fontSize: 12,
      ),
      bodyText2: TextStyle(
        color: Color(0xFF2B2E4A),
        fontWeight: FontWeight.normal,
        // fontSize: 10,
      ),

    ),*/
  );
}
