import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

final ThemeData lightTheme = ThemeData(
  progressIndicatorTheme:
      const ProgressIndicatorThemeData(color: AppColors.primaryColor),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 0,
    color: AppColors.scaffoldBackground,
    scrolledUnderElevation: 0,
    titleTextStyle: TextStyle(
        color: AppColors.primarytextColor,
        fontSize: 16,
        fontWeight: FontWeight.bold),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.scaffoldBackground,
    selectedItemColor: AppColors.primaryColor,
    unselectedItemColor: Colors.grey,
  ),
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  primaryColor: AppColors.primaryColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(surface: Colors.white),
);
