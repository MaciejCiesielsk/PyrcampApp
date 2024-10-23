import 'package:flutter/material.dart';
//import 'package:pyrcamp_app/features/form_screen/additional_person_form.dart';
//import 'package:pyrcamp_app/features/form_screen/main_person_form.dart';
import 'package:pyrcamp_app/features/form_screen/person.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pyrcamp_app/main.dart';
import 'package:country_picker/country_picker.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  var _extraPerson = false;
  var _additionalPerson = 0;
  var _invoiceWanted = false;
  late Person mainPerson = Person();
  late Person additonalPerson1;
  late Person additonalPerson2;
  late Person additonalPerson3;
  late Person additonalPerson4;

  void submit() async {
    // to unlock onSaved option
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    try {
      await FirebaseFirestore.instance.collection('test_form_main').doc().set({
        'name': mainPerson.name,
        'surname': mainPerson.surname,
        'address': mainPerson.address,
        'zipcode': mainPerson.zipCode,
        'city': mainPerson.city,
        'country': mainPerson.country,
        'gender': mainPerson.gender,
        'birthdate': mainPerson.birthDate,
        //'buyer': currentUser.uid
      });
    } on FirebaseException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.message ?? 'abc'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket Form Test'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                //formularz osoby kupujacej
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),

                      const Text(
                        'Osoba kupująca',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),

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
                            mainPerson.name = enteredValue!;
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
                            mainPerson.surname = enteredValue!;
                          }),
                      const SizedBox(
                        height: 12,
                      ),

                      // ADDRESS
                      TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Adres', border: OutlineInputBorder()),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter a valid address';
                            }
                            return null;
                          },
                          onSaved: (enteredValue) {
                            mainPerson.address = enteredValue!;
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
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter a valid zip code';
                                  }
                                  return null;
                                },
                                onSaved: (enteredValue) {
                                  mainPerson.zipCode = enteredValue!;
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
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter a valid City';
                                }
                                return null;
                              },
                              onSaved: (enteredValue) {
                                mainPerson.city = enteredValue!;
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
                              mainPerson.country.isEmpty
                                  ? 'Brak wybranego kraju'
                                  : mainPerson.country,
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
                                      mainPerson.country = country.displayName;
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
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), label: Text('Płeć')),
                        items: const [
                          DropdownMenuItem(
                            //value passed to firebase
                            value: 'kobieta',
                            //visible text
                            child: Text('Kobieta'),
                          ),
                          DropdownMenuItem(
                            value: 'mezczyzna',
                            child: Text('Mężczyzna'),
                          ),
                          DropdownMenuItem(
                            value: 'helikopter bojowy',
                            child: Text('helikopter bojowy'),
                          ),
                        ],
                        //onChanged is required by function constructor
                        onChanged: (v) {},
                        onSaved: (enteredValue) {
                          mainPerson.gender = enteredValue!;
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
                            mainPerson.birthDate = enteredValue!;
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
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: _extraPerson,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _extraPerson = newValue!;
                          additonalPerson1 = Person();
                          _additionalPerson = 0;
                        });
                      },
                    ),
                    const Text('Czy chcesz kupić bilet dla osób dodatkowych?'),
                  ],
                ),
                if (_extraPerson)
                  //osoby dodatkowe
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('osoby dodatkowe')),
                    items: const [
                      DropdownMenuItem(
                        //value passed to firebase
                        value: 1,
                        //visible text
                        child: Text('1'),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text('2'),
                      ),
                      DropdownMenuItem(
                        value: 3,
                        child: Text('3'),
                      ),
                    ],
                    //onChanged is required by function constructor
                    onChanged: (int? enteredNumber) {
                      setState(
                        () {
                          _additionalPerson = enteredNumber!;
                        },
                      );
                    },
                    onSaved: (enteredValue) {
                      //_additionalPerson = enteredValue!;
                    },
                  ),
                if (_extraPerson)
                  //forms for additional people
                  Column(
                    children: [
                      for (var i = 0; i < _additionalPerson; i++)
                        Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Osoba dodatkowa ${i + 1}',
                              style: const TextStyle(
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            //AdditionalPersonForm(
                            //additionalPerson: additonalPerson1,
                            //),
                          ],
                        )
                    ],
                  ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    submit();
                  },
                  child: const Text('Prześlij formularz zgłoszeniowy'),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
