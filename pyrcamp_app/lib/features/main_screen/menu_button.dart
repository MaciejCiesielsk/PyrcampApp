import 'package:flutter/material.dart';
import 'package:pyrcamp_app/data/features_list.dart';
import 'package:pyrcamp_app/features/main_screen/menu_item.dart';

class MenuButton extends StatelessWidget {
  //constructor
  const MenuButton(
      {super.key, required this.menuItem, required this.onSelectMenuItem});

  //variables
  final MenuItem menuItem;
  final void Function() onSelectMenuItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //what happens after selecting menu item
      onTap: onSelectMenuItem,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          //tu tez musimy dodac borderRadius, zeby zaokraglowny byl przycisk, ktory obecnie nie jest klikniety
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [
              //const Color.fromARGB(255, 197, 197, 63).withOpacity(0.2),
              const Color.fromARGB(255, 197, 197, 63),
              const Color.fromARGB(255, 197, 197, 63),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(menuItem.title),
      ),
    );
  }
}
