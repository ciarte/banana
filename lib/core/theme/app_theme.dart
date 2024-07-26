import 'package:banana/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static _inputBorder([Color color = AppPallete.borderColor]) =>
      OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: color, width: 2));

  ThemeData getTheme() => ThemeData(
        primaryColor: AppPallete.seedColor,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: AppPallete.backgroundColor,
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(20),
          enabledBorder: _inputBorder(),
          focusedBorder: _inputBorder(AppPallete.focusBorderColor),
          errorBorder: _inputBorder(AppPallete.errorColor),
          focusedErrorBorder: _inputBorder(AppPallete.focusBorderColor),
        ),
      );
}
