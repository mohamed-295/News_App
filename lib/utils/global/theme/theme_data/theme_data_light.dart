import 'package:flutter/material.dart';
import 'package:myapp/utils/global/theme/app_color/app_color_light.dart';

ThemeData getThemeDataLight() => ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColorLight.primaryColor,
  scaffoldBackgroundColor: AppColorLight.scaffoldBackgroundColor,
  useMaterial3: true,

  bottomNavigationBarTheme:const BottomNavigationBarThemeData(
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.black,
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColorLight.bottomNavBarBackgroundColor,
    elevation: 2,
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),            
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColorLight.bottomNavBarBackgroundColor,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: AppColorLight.titleTextColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),

  dividerColor: AppColorLight.dividerColor,

);

