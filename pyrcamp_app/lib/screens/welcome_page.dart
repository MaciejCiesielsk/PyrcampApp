import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to pyrcamp app'),
        actions: [
          IconButton(onPressed: () {
            FirebaseAuth.instance.signOut();
          }, icon: Icon(Icons.exit_to_app))
        ],
      ),
      backgroundColor: Color.fromARGB(255, 230, 39, 236),
      body: const Center(
        child: Text(
          'Welcome logged in user',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
