import 'package:flutter/material.dart';
import 'package:pyrcamp_app/features/form_screen/additional_person_form.dart';
import 'package:pyrcamp_app/features/form_screen/main_person_form.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreen2State();
}

class _FormScreen2State extends State<FormScreen> {
  var _extraPerson = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket Form Test'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                child: MainPersonForm(),
                height: 700,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _extraPerson,
                    onChanged: (bool? newValue) {
                      setState(() {
                        _extraPerson = newValue!;
                      });
                    },
                  ),
                  const Text('Dodatkowa osoba'),
                ],
              ),
              if (_extraPerson)
                Container(
                  child: AdditionalPersonForm(),
                  height: 700,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
