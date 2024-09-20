import 'package:flutter/material.dart';


class PTextTheme{
  PTextTheme._();
  // copyWith takes all the properties(which need to change) and their corresponding values and returns new object with your desired properties
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.blue),
    // Text('Welcome to pyrcamp app', style: Theme.of(context).textTheme.headlineLarge)  <----- USE CASE
    headlineMedium: const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black),
  );
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.red),
    headlineMedium: const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.white),
  );
}

// possibilities are endless