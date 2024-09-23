import 'package:flutter/material.dart';
import 'package:pyrcamp_app/utils/theme/custom_themes/text_theme.dart';
import 'package:pyrcamp_app/utils/theme/custom_themes/elevated_button_theme.dart';



class PAppTheme {
  // P in class name stands for Pyrcamp

  PAppTheme._(); // _ means private constructor: it cannot be changed from outside of the file


  // LIGHT THEME
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: PTextTheme.lightTextTheme, //imported from another file. textTheme has predefined text themes. More info in comments in text_theme.dart
    elevatedButtonTheme: PElevatedButtonTheme.lightElevatedButtonTheme,
  );

  // DARK THEME
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: PTextTheme.darkTextTheme,
  );
}

// as you can see it can go on and on with pretty much anything
// it can look exactly how we want it to be 
