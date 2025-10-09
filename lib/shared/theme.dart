import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.appBlue,
  dividerColor: Colors.blueGrey.withValues(alpha: .3),
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    bodyLarge:
        TextStyle(color: AppColors.blackText, fontFamily: "SpaceGrotesk"),
    bodyMedium:
        TextStyle(color: AppColors.blackText, fontFamily: "SpaceGrotesk"),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: AppColors.blackText,
    centerTitle: true,
    elevation: 5,
    shadowColor: AppColors.grey.withValues(alpha: 0.1),
    surfaceTintColor: Colors.transparent,
    titleTextStyle: const TextStyle(
        color: AppColors.blackText, fontFamily: "SpaceGrotesk", fontSize: 20),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.appBlue,
      foregroundColor: AppColors.white,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  tabBarTheme: TabBarThemeData(
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
  secondaryHeaderColor: AppColors.black,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.white, fontFamily: "SpaceGrotesk"),
    bodyMedium: TextStyle(color: AppColors.white, fontFamily: "SpaceGrotesk"),
  ),
  appBarTheme: AppBarTheme(
      elevation: 5,
      shadowColor: AppColors.grey.withValues(alpha: 0.1),
      backgroundColor: AppColors.appGrey,
      foregroundColor: AppColors.white,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: const TextStyle(
          color: Colors.white, fontFamily: "SpaceGrotesk", fontSize: 20)),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blueGrey,
      foregroundColor: AppColors.white,
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
  tabBarTheme:  TabBarThemeData(
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

  static const red = Color(0xffFF3D00);

  static const green = Colors.green;
}
