import 'package:flutter/material.dart';
import 'package:pyrcamp_app/features/form_screen/additional_person_form.dart';
import 'package:pyrcamp_app/features/form_screen/main_person_form.dart';
import 'package:pyrcamp_app/features/form_screen/person.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  var _extraPerson = false;
  var _additionalPerson = 0;
  late Person mainPerson = Person();
  late Person additonalPerson1;
  late Person additonalPerson2;
  late Person additonalPerson3;
  late Person additonalPerson4;


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
                MainPersonForm(mainPerson: mainPerson,),
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
                            AdditionalPersonForm(
                              additionalPerson: additonalPerson1,
                            ),
                          ],
                        )
                    ],
                  ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
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
