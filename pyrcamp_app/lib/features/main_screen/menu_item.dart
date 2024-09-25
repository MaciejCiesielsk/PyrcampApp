import 'package:flutter/material.dart';

class MenuItem {
  //constructor
  const MenuItem(
      {required this.id,
      required this.title,
      required this.nextScreen,
      this.color = Colors.green});

  //variables
  final String id;
  final String title;
  final Widget nextScreen;
  final Color color;
}
