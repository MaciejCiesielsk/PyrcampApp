import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to pyrcamp app', style: Theme.of(context).textTheme.headlineLarge),
        actions: [
          IconButton(onPressed: () {
            FirebaseAuth.instance.signOut();
          }, icon: const Icon(Icons.exit_to_app))
        ],
      ),
      backgroundColor: Color.fromARGB(255, 230, 39, 236),
      body: Center(
        child: Text(
          'Welcome logged in user',
          style: Theme.of(context).textTheme.headlineMedium
        ),
      ),
    );
  }
}
