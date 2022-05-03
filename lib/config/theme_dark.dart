import 'package:flutter/material.dart';

ThemeData themedark() {
  return ThemeData(
    primaryColorDark: Colors.black,
    primarySwatch: Colors.blueGrey,
    //primaryColor: Colors.black,
    //primaryColorLight: Color(0xFFFE9AAA),
    accentColor: Color.fromARGB(255, 27, 26, 26),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Color(0xFFF4F4F4),

    fontFamily: 'Optima',
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Color(0xFF2B2E4A),
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
      headline2: TextStyle(
        color: Color(0xFF2B2E4A),
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      headline3: TextStyle(
        color: Color(0xFF2B2E4A),
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      headline4: TextStyle(
        color: Color(0xFF2B2E4A),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      headline5: TextStyle(
        color: Color(0xFF2B2E4A),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      headline6: TextStyle(
        color: Color(0xFF2B2E4A),
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      bodyText1: TextStyle(
        color: Color(0xFF2B2E4A),
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      bodyText2: TextStyle(
        color: Color(0xFF2B2E4A),
        fontWeight: FontWeight.normal,
        fontSize: 10,
      ),
    ),
  );
}
