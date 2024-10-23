import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:pyrcamp_app/features/form_screen/person.dart';

class AdditionalPersonForm extends StatefulWidget {
  const AdditionalPersonForm({super.key, required this.additionalPerson});
  final Person additionalPerson;

  @override
  State<AdditionalPersonForm> createState() => _FormScreenState();
}

class _FormScreenState extends State<AdditionalPersonForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Form(
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
                widget.additionalPerson.name = enteredValue;
              }),
          const SizedBox(
            height: 12,
          ),

          // SURNAME
          TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Nazwisko', border: OutlineInputBorder()),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a valid surname';
                }
                return null;
              },
              onSaved: (enteredValue) {
                widget.additionalPerson.surname = enteredValue;
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
                widget.additionalPerson.address = enteredValue;
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
                      widget.additionalPerson.zipCode = enteredValue;
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
                      labelText: 'Miasto', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a valid City';
                    }
                    return null;
                  },
                  onSaved: (enteredValue) {
                    widget.additionalPerson.city = enteredValue;
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
                  widget.additionalPerson.country.isEmpty
                      ? 'Brak wybranego kraju'
                      : widget.additionalPerson.country,
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
                          widget.additionalPerson.country = country.displayName;
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
              widget.additionalPerson.gender = enteredValue;
            },
          ),

          //const DropdownSexMenu(),
          const SizedBox(
            height: 12,
          ),

          // BIRTH DATE
          TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Data urodzenia', border: OutlineInputBorder()),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a valid BirthDate';
                }
                return null;
              },
              onSaved: (enteredValue) {
                widget.additionalPerson.birthDate = enteredValue;
              }),
        ],
      ),
    );
  }
}
