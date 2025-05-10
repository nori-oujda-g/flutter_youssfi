// pour générer il suffit d'ecrire : st
import 'package:flutter/material.dart';
import 'package:flutter_youssfi/config/GlobalParams.dart';

class SimpleLayout extends StatelessWidget {
  const SimpleLayout({super.key});
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(home: SimpleText());
    // return MaterialApp(home: Mycenter());
    return MaterialApp(
      title: 'flutter youssfi',
      debugShowCheckedModeBanner: false, //pour enlever la barriere :debug
      routes: Globalparams.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        // primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      // home: HomePage(),
    );
  }
}
