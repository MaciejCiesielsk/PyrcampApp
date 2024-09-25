import 'package:flutter/material.dart';
import 'package:pyrcamp_app/data/features_list.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('imie i nazwisko'),
            accountEmail: Text('email'),
            currentAccountPicture: Image.asset(
              'lib/assets/images/pyrcamp_logo.png',
              //width: 200,
            ),
            decoration: const BoxDecoration(
              color: const Color.fromARGB(255, 66, 39, 83),
            ),
          ),
          for (final item in availableMenuItems)
            ListTile(
              leading: item.icon,
              title: Text(item.title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item.nextScreen),
                );
              },
            )
        ],
      ),
    );
  }
}
