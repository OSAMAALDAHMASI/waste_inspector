import 'package:flutter/material.dart';
import 'package:waste_inspector_ai/core/constant/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: AppColors.white),
          titleTextStyle: TextStyle(color: AppColors.white, fontSize: 22.0)),
      primaryColor: AppColors.premary,
      buttonTheme: ButtonThemeData(buttonColor: AppColors.premary),
      fontFamily: 'Tajawal',
      textTheme: TextTheme(
          titleSmall: TextStyle(fontSize: 18, color: AppColors.black),
          titleLarge: TextStyle(color: AppColors.premary, fontSize: 20, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(
            color: AppColors.textBodyColor,
            fontSize: 16,
          )));
}
