import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pyrcamp_app/features/form_screen/main_person_form.dart';
import 'package:pyrcamp_app/features/main_screen/widgets/menu_button.dart';
import 'package:pyrcamp_app/features/main_screen/widgets/features_list.dart';
import 'package:pyrcamp_app/features/nav_bar_screen/nav_bar_screen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: question: why name can't be NavigationBar() ?
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text('Welcome to pyrcamp app'),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      //backgroundColor: const Color.fromARGB(255, 66, 39, 83),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (final item in availableMenuItems)
              Column(
                children: [
                  MenuButton(
                    menuItem: item,
                    onSelectMenuItem: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => item.nextScreen),
                      );
                    },
                  ),
                  const SizedBox(height: 12)
                ],
              ),
            const SizedBox(height: 12),
            //custom button
            /*
            MenuButton(
              menuItem: ,
              onSelectMenuItem: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormScreen()),
                );
              },
            ),
            */
            const SizedBox(height: 12),
            //elevated button
            ElevatedButton(
              child: const Text('Cos tam'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
