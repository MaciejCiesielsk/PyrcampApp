import 'package:flutter/material.dart';
import 'package:pyrcamp_app/features/main_screen/widgets/features_list.dart';
import 'package:pyrcamp_app/main.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});




  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(username), 
            accountEmail: Text(userEmail),
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
