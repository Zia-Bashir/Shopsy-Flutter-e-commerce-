import 'package:flutter/material.dart';
import 'package:shopsy/src/theme/elevated_button_theme.dart';
import 'package:shopsy/src/theme/text_theme.dart';

class MyTheme {
  MyTheme._();
  //= Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.orange,

    //* -- Text Theme
    textTheme: AppTextTheme.lightTextTheme,

    //* -- Elevated Button Theme
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
  );
  //= Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.orange,

    //* -- Text Theme
    textTheme: AppTextTheme.darkTextTheme,

    //* -- Elevated Button Theme
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
  );
}
