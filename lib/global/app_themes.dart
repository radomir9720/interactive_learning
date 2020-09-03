import 'package:flutter/material.dart';

enum AppTheme { light, dark }

final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.light: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    primaryColorLight: Colors.white,
    accentColor: const Color(0xff68A691),
    // accentColor: const Color(0xff7ac152),
    toggleableActiveColor: Colors.greenAccent,
    cardColor: const Color(0xffe9e8e8),
    highlightColor: Colors.grey.withOpacity(0.3),
    splashColor: Colors.transparent,
    errorColor: const Color(0xffE4695D),
    appBarTheme: const AppBarTheme(
      color: Color(0xffe9e8e8),
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    textTheme: const TextTheme(
      headline3: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 35,
      ),
      headline4: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
      },
    ),
  ),
  AppTheme.dark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    // accentColor: const Color(0xff7ac152),
    accentColor: const Color(0xff68A691),
    toggleableActiveColor: Colors.greenAccent,
    cardColor: const Color(0xff424141),
    highlightColor: Colors.grey.withOpacity(0.3),
    splashColor: Colors.transparent,
    errorColor: const Color(0xffE4695D),
    primaryColorLight: Colors.white,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Color(0xff424141),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    textTheme: const TextTheme(
      headline3: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 35,
      ),
      headline4: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
      },
    ),
  ),
};
