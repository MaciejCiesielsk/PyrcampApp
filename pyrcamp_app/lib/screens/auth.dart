import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//global variables
//access to variable Firebase, which will be created in the background by FireBase SDK
final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _enteredUsername = '';

  void _submit() async {
    // we send a request to firebase which indicates whether the data is correct
    final isValid = _formKey.currentState!.validate();

    //if data is incorrect or insufficient
    if (!isValid) {
      return;
    }
    // to unlock onSaved option
    _formKey.currentState!.save();
    print(_enteredEmail);
    print(_enteredPassword);

    try {
      if (_isLogin) {
        //logic to log users in
        final userCredentials = await _firebase.signInWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
      } else {
        // code to create new user
        // behind the scenes this method from Firebase SDK will send a HTTP request to Firebase
        final userCredentials = await _firebase.createUserWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);

        //tworzenie nowego dokumentu w Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredentials.user!.uid)
            .set({'username': _enteredUsername, 'email': _enteredEmail});
      }
    } on FirebaseException catch (error) {
      // error handling, passing info which form field has not passed the validation
      if (error.code == 'email-already-in-use') {
        // TODO : check error codes, we might not need all of the error codes
      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Authentication failed.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 63, 109, 67),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 100,
              ),
              //TODO: make it responsive, delete fixed values
              Container(
                child: Image.asset(
                  'lib/assets/images/pyrcamp_logo.png',
                  width: 200,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Card(
                margin: const EdgeInsets.all(40),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Email",
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter a valid email address.';
                              }
                              return null;
                            },
                            onSaved: (enteredValue) {
                              _enteredEmail = enteredValue!;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Password',
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.trim().length < 6) {
                                return 'Password must be at least 6 characeters long.';
                              }
                              return null;
                            },
                            onSaved: (enteredValue) {
                              _enteredPassword = enteredValue!;
                            },
                          ),
                          if (!_isLogin)
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Username',
                              ),
                              enableSuggestions: false,
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    value.trim().length < 3) {
                                  return 'Please enter a username with at least 3 characters.';
                                }
                                return null;
                              },
                              onSaved: (enteredValue) {
                                _enteredUsername = enteredValue!;
                              },
                            ),
                          const SizedBox(
                            height: 12,
                          ),
                          ElevatedButton(
                            onPressed: _submit,
                            child: Text(_isLogin ? 'Login' : 'Sign up'),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                            child: Text(
                              _isLogin
                                  ? 'Create an account'
                                  : 'I already have an account',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
