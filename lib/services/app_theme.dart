import 'package:flutter/material.dart';

import 'app_colors.dart';

enum AppTheme {
  lightTheme,
  darkTheme,
}

class AppThemes {
  static final appThemeData = {
    //Dark Theme
    AppTheme.darkTheme: ThemeData(
      primarySwatch: AppColors.primarySwatch,
      primaryColor: AppColors.primaryColor,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      dividerColor: AppColors.dividerColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.fabBgColor,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(AppColors.buttonForegroundColor),
        ),
      ),
      textTheme: TextTheme(
        titleMedium: TextStyle(color: AppColors.textColor),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.navBarBgColor, unselectedItemColor: AppColors.unselectedItemColor),
    ),

    //Light Theme
    AppTheme.lightTheme: ThemeData(
      primarySwatch: AppColors.primaryLightSwatch,
      primaryColor: AppColors.primaryLightColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundLightColor,
      dividerColor: AppColors.dividerLightColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.fabBgLightColor,
        foregroundColor: AppColors.fabForegroundLightColor,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(AppColors.buttonForegroundLightColor),
        ),
      ),
      textTheme: TextTheme(
        titleMedium: TextStyle(color: AppColors.textLightColor),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.navBarBgLightColor,
          selectedItemColor: AppColors.selectedItemLightColor,
          unselectedItemColor: AppColors.unselectedItemLightColor),
    ),
  };
}
