import 'package:flutter/material.dart';
import 'package:flutter_youssfi/ui/widgets/MyMenu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyMenu(), //drawer => menu
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('abdennour home'),
      ),
      body: Center(
        child: Text(
          'salamo alaykom',
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 22,
            // fontFamily: 'monospace',
            fontFamily: 'emoji',
          ),
        ),
      ),
    );
  }
}
