import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pyrcamp_app/utils/theme/theme.dart';
import 'firebase_options.dart';
import 'package:pyrcamp_app/features/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pyrcamp_app/features/main_screen/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

var username = '';
var userEmail = '';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pyrcamp App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: PAppTheme.lightTheme,
      darkTheme: PAppTheme.darkTheme,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Czekaj');
          }

          if (snapshot.hasData) {
            return const WelcomePage();
          }

          return const AuthScreen();
        },
      ),
    );
  }
}
