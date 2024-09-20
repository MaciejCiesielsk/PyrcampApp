import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pyrcamp_app/screens/ticket_form_screen.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: const Color.fromARGB(255, 51, 189, 81),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Cos tam'),
              onPressed: () {
                Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => FormScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
