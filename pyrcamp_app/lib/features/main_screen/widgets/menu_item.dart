import 'package:flutter/material.dart';

class MenuItem {
  //constructor
  const MenuItem(
      {required this.id,
      required this.title,
      required this.nextScreen,
      required this.icon,
      this.color = Colors.green});

  //variables
  final String id;
  final String title;
  final Widget nextScreen;
  final Icon icon;
  final Color color;
}
