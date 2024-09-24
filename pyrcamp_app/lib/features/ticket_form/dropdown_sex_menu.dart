import 'package:flutter/material.dart';


const List<String> list = <String>['-wybierz płeć-', 'Mężczyzna', 'Kobieta', 'Helikopter bojowy'];

class DropdownSexMenu extends StatefulWidget {
  const DropdownSexMenu({super.key});

  @override
  State<DropdownSexMenu> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownSexMenu> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list.first,
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}