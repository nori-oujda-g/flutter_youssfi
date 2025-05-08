import 'package:flutter/material.dart';

class Galery extends StatelessWidget {
  const Galery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('GALERY'),
      ),
      body: Center(
        child: Text(
          'page galery',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
