import 'package:flutter/material.dart';

class Meteo extends StatelessWidget {
  const Meteo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('METEO'),
      ),
      body: Center(
        child: Text(
          'page meteo',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
