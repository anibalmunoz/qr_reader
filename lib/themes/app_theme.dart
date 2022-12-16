import 'package:flutter/material.dart';
import 'package:qr_reader/utils/app_color.dart';

class AppTheme {
  AppTheme._privateConstructor();
  static final AppTheme shared = AppTheme._privateConstructor();

  ThemeData themeData = ThemeData(
      primaryColor: Colors.red,
      appBarTheme: AppBarTheme(backgroundColor: AppColor.shared.primaryColor),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: AppColor.shared.primaryColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: AppColor.shared.primaryColor));
}
