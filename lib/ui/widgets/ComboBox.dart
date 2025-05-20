// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ComboBox extends StatefulWidget {
  String selectedVal;
  // = 'Pomme'; // Valeur initiale
  List<String> items;
  // = ['Pomme', 'Banane', 'Orange', 'Mangue'];
  void Function(String val) operation;
  ComboBox({
    Key? key,
    required this.selectedVal,
    required this.operation,
    required this.items,
  }) : super(key: key);

  @override
  _ComboBoxState createState() => _ComboBoxState();
}

class _ComboBoxState extends State<ComboBox> {
  @override
  Widget build(BuildContext context) {
    String selectedVal = widget.selectedVal;
    // = 'Pomme'; // Valeur initiale
    // List<String> items=widget.items;

    return Center(
      child: DropdownButton<String>(
        value: selectedVal,
        icon: Icon(Icons.arrow_downward),
        onChanged: (String? val) {
          widget.operation(val!);
        },
        // onChanged: (String? nouvelleValeur) {
        //   setState(() {
        //     widget.selectedVal = nouvelleValeur!;
        //   });
        // },
        items:
            widget.items.map<DropdownMenuItem<String>>((String valeur) {
              return DropdownMenuItem<String>(
                value: valeur,
                child: Text(valeur),
              );
            }).toList(),
      ),
    );
  }
}
