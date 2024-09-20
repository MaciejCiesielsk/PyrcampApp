import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredSurname = '';
  var _enteredStreet = '';
  var _enteredZipCode = '';
  var _enteredCity = '';
  var _enteredCountry = '';
  var _enteredSex = '';
  var _enteredBirthDate = '';

  void _submit() async {
    // to unlock onSaved option
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket Form Test'),
      ),
      body: Center(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Imie'),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Nazwisko'),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Ulica'),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Kod pocztowy'),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Miasto'),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Państwo'),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Płeć'),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Data urodzenia'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
