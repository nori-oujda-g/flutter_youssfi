import 'package:flutter/material.dart';

class ComboBix extends StatefulWidget {
  @override
  _ComboBixState createState() => _ComboBixState();
}

class _ComboBixState extends State<ComboBix> {
  String? valeurSelectionnee = 'Pomme'; // Valeur initiale
  List<String> options = ['Pomme', 'Banane', 'Orange', 'Mangue'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        value: valeurSelectionnee,
        icon: Icon(Icons.arrow_downward),
        onChanged: (String? nouvelleValeur) {
          setState(() {
            valeurSelectionnee = nouvelleValeur;
          });
        },
        items:
            options.map<DropdownMenuItem<String>>((String valeur) {
              return DropdownMenuItem<String>(
                value: valeur,
                child: Text(valeur),
              );
            }).toList(),
      ),
    );
  }
}
