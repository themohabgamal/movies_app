import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static final Color mainColor = const Color(0xFF181A20);
  static final Color yellow = const Color(0xFFE21221);
  static final Color secondaryColor = const Color(0xFC0E1014);
  static final Color gray = const Color(0xFFA0A0A0);
  static ThemeData lightTheme = ThemeData(
    splashColor: Colors.transparent,
      scaffoldBackgroundColor: mainColor,
      appBarTheme:  AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent
      ),
      textTheme: const TextTheme(
        headline6: TextStyle(
          fontSize: 18,
          color: Colors.white,
          decoration: TextDecoration.none
        ),
        headline5: TextStyle(
            fontSize: 22,
            color: Colors.white,
            decoration: TextDecoration.none
        ),
        headline4: TextStyle(
            fontSize: 26,
            color: Colors.white,
            decoration: TextDecoration.none
        ),
      ),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(
            elevation: 10,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: yellow,
            unselectedItemColor: Colors.grey,
            backgroundColor: secondaryColor.withRed(20)
          )
  );
}
