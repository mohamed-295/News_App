import 'package:flutter/material.dart';
import 'package:myapp/utils/global/theme/app_color/app_color_dark.dart';

ThemeData getThemeDataDark() => ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColorDark.primaryColor,
  scaffoldBackgroundColor: AppColorDark.scaffoldBackgroundColor,
  useMaterial3: true,

  bottomNavigationBarTheme:const BottomNavigationBarThemeData(
    selectedItemColor: AppColorDark.bottomNavBarItemColor,
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColorDark.bottomNavBarBackgroundColor,
    elevation: 2,
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),            
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColorDark.appBarBackgroundColor,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: AppColorDark.titleTextColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),

  dividerColor: AppColorDark.dividerColor,

);

