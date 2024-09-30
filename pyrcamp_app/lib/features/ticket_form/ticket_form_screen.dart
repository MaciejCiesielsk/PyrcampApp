import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  var _invoiceWanted = false;
  var _enteredName = '';
  var _enteredSurname = '';
  var _enteredAddress = '';
  var _enteredZipCode = '';
  var _enteredCity = '';
  var _enteredCountry = 'Poland (PL) [+48]';
  var _enteredSex = '';
  var _enteredBirthDate = '';

  void _submit() async {
    // to unlock onSaved option
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    try {
      await FirebaseFirestore.instance
          .collection('2k25')
          .doc(_enteredName)
          .set({
        'name': _enteredName,
        'surname': _enteredSurname,
        'address': _enteredAddress,
        'zipcode': _enteredZipCode,
        'city': _enteredCity,
        'country': _enteredCountry,
        'sex': _enteredSex,
        'birthdate': _enteredBirthDate
      });
    } on FirebaseException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.message ?? 'abc'),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket Form Test'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            // NAME
                            TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Imie',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter a valid name';
                                  }
                                  return null;
                                },
                                onSaved: (enteredValue) {
                                  _enteredName = enteredValue!;
                                }),
                            const SizedBox(
                              height: 12,
                            ),

                            // SURNAME
                            TextFormField(
                                decoration: const InputDecoration(
                                    labelText: 'Nazwisko',
                                    border: OutlineInputBorder()),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter a valid surname';
                                  }
                                  return null;
                                },
                                onSaved: (enteredValue) {
                                  _enteredSurname = enteredValue!;
                                }),
                            const SizedBox(
                              height: 12,
                            ),

                            // ADDRESS
                            TextFormField(
                                decoration: const InputDecoration(
                                    labelText: 'Adres',
                                    border: OutlineInputBorder()),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter a valid address';
                                  }
                                  return null;
                                },
                                onSaved: (enteredValue) {
                                  _enteredAddress = enteredValue!;
                                }),
                            const SizedBox(
                              height: 12,
                            ),

                            Row(
                              children: [
                                // ZIPCODE
                                Expanded(
                                  child: TextFormField(
                                      decoration: const InputDecoration(
                                          labelText: 'Kod pocztowy',
                                          border: OutlineInputBorder()),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Please enter a valid zip code';
                                        }
                                        return null;
                                      },
                                      onSaved: (enteredValue) {
                                        _enteredZipCode = enteredValue!;
                                      }),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                // CITY
                                Expanded(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: 'Miasto',
                                        border: OutlineInputBorder()),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please enter a valid City';
                                      }
                                      return null;
                                    },
                                    onSaved: (enteredValue) {
                                      _enteredCity = enteredValue!;
                                    },
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 12,
                            ),

                            // COUNTRY
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    _enteredCountry.isEmpty
                                        ? 'Brak wybranego kraju'
                                        : _enteredCountry,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showCountryPicker(
                                        context: context,
                                        onSelect: (Country country) {
                                          setState(() {
                                            _enteredCountry =
                                                country.displayName;
                                          });
                                        },
                                      );
                                    },
                                    child: const Text('Wybierz państwo'),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),

                            // SEX
                            DropdownButtonFormField(
                              items: const [
                                DropdownMenuItem(
                                  //value passed to firebase
                                  value: 'male',
                                  //visible text
                                  child: Text('male'),
                                ),
                                DropdownMenuItem(
                                  value: 'female',
                                  child: Text('female'),
                                ),
                                DropdownMenuItem(
                                  value: 'helikopter bojowy',
                                  child: Text('helikopter bojowy'),
                                ),
                              ],
                              //onChanged is required by function constructor
                              onChanged: (v) {},
                              onSaved: (enteredValue) {
                                _enteredSex = enteredValue!;
                              },
                            ),

                            //const DropdownSexMenu(),
                            const SizedBox(
                              height: 12,
                            ),

                            // BIRTH DATE
                            TextFormField(
                                decoration: const InputDecoration(
                                    labelText: 'Data urodzenia',
                                    border: OutlineInputBorder()),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter a valid BirthDate';
                                  }
                                  return null;
                                },
                                onSaved: (enteredValue) {
                                  _enteredBirthDate = enteredValue!;
                                }),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                  value: _invoiceWanted,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      _invoiceWanted = newValue!;
                                    });
                                  },
                                ),
                                const Text('Chcę fakturę'),
                              ],
                            ),

                            if (_invoiceWanted)
                              Column(
                                children: [
                                  TextFormField(
                                    decoration: const InputDecoration(
                                        // NAME OF THE COMPANY
                                        labelText: 'Nazwa',
                                        border: OutlineInputBorder()),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),

                                  // NIP
                                  TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: 'NIP',
                                        border: OutlineInputBorder()),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),

                                  // CONTACT EMAIL
                                  TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: 'E-mail kontaktowy',
                                        border: OutlineInputBorder()),
                                  ),
                                ],
                              ),
                            ElevatedButton(
                              onPressed: _submit,
                              child:
                                  const Text('Prześlij formularz zgłoszeniowy'),
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
      ),
    );
  }
}
