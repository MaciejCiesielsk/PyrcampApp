import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 63, 109, 67),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //TODO: make it responsive
              Container(
                child: Image.asset('/home/maciej/workspace/pyrcamp_app/pyrcamp_app/lib/assets/images/pyrcamp_logo.png',),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
