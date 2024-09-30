import 'package:flutter/material.dart';

class PElevatedButtonTheme{
  PElevatedButtonTheme._(); // to avoid creating instances

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom( // styleFrom is a simpler way to apply Button Style
      foregroundColor: const Color.fromARGB(255, 0, 0, 0),
      backgroundColor: const Color.fromARGB(255, 197, 197, 63),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      elevation: 0,
    ),
  );
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom( 
      elevation: 0,
    ),
  );
}