import 'package:flutter/material.dart';
import 'package:flutter_youssfi/ui/pages/HomePage.page.dart';
import 'package:flutter_youssfi/ui/pages/counter.page.dart';
import 'package:flutter_youssfi/ui/pages/galery.page.dart';
import 'package:flutter_youssfi/ui/pages/meteo.page.dart';

// https://www.youtube.com/watch?v=DvAq5dKN5uk&list=PLzFUEeWdXH-0xB7f8dxMCcwZKIdLaLMRL
// 00:48:00
//v2
void main() => runApp(MyApp());

// pour générer il suffit d'ecrire : st
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(home: SimpleText());
    // return MaterialApp(home: Mycenter());
    return MaterialApp(
      title: 'exp2',
      routes: {
        '/': (context) => HomePage(),
        '/meteo': (context) => Meteo(),
        '/galery': (context) => Galery(),
        '/counter': (context) => Counter(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        // primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      // home: HomePage(),
    );
  }
}
