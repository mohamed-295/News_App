import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/utils/global/theme/theme_data/theme_data_dark.dart';
import 'package:myapp/utils/global/theme/theme_data/theme_data_light.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(getThemeDataLight()){
    _getThemeFromPrefs();
  }

  Future<void> _saveThemePrefs(Brightness brightness) async {
    final themeIndex = brightness == Brightness.light ? 0 : 1;
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setInt('theme', themeIndex);
    debugPrint("Theme Saved Successfully");
  }

  Future<void> _getThemeFromPrefs() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    final savedThemeIndex = sharedPreferences.getInt('theme');
    final savedTheme= savedThemeIndex == 0 ? getThemeDataLight() : getThemeDataDark();
    emit(savedTheme);
    debugPrint("Theme Found Successfully");
  }

  void changeTheme() {
    final newTheme =state.brightness == Brightness.light ? getThemeDataDark() : getThemeDataLight();
    emit(newTheme);
    _saveThemePrefs(newTheme.brightness);
    debugPrint("Theme Changed Successfully");
  }

 
}
