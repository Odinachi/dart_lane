import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.appBlue,
  dividerColor: Colors.blueGrey.withOpacity(.3),
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    bodyLarge:
        TextStyle(color: AppColors.blackText, fontFamily: "SpaceGrotesk"),
    bodyMedium:
        TextStyle(color: AppColors.blackText, fontFamily: "SpaceGrotesk"),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.appBlue,
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.appBlue,
      foregroundColor: Colors.white,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  tabBarTheme: const TabBarTheme(
    labelColor: AppColors.appBlue,
    unselectedLabelColor: Colors.black54,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: AppColors.appBlue, width: 2),
    ),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blueGrey,
  scaffoldBackgroundColor: AppColors.appGrey,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.white, fontFamily: "SpaceGrotesk"),
    bodyMedium: TextStyle(color: AppColors.white, fontFamily: "SpaceGrotesk"),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blueGrey,
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.white,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueGrey),
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  dividerColor: Colors.blueGrey,
  tabBarTheme: const TabBarTheme(
    labelColor: Colors.white,
    unselectedLabelColor: Colors.white70,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: Colors.blueGrey, width: 2),
    ),
  ),
);

class AppColors {
  static const appBlue = Color(0xff359EFF);
  static const white = Colors.white;
  static const black = Colors.black;
  static const grey = Colors.grey;
  static const blackText = Color(0xff121727);
  static const appGrey = Color(0xff111C22);
}


