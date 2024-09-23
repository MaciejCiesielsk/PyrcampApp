import 'package:flutter/material.dart';

class PElevatedButtonTheme{
  PElevatedButtonTheme._(); // to avoid creating instances

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom( // styleFrom is a simpler way to apply Button Style
      foregroundColor: const Color.fromARGB(255, 63, 235, 48),
      elevation: 0,
    ),
  );
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom( 
      elevation: 0,
    ),
  );
}