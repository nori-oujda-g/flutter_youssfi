// pour générer il suffit d'ecrire : st
import 'package:flutter/material.dart';
import 'package:flutter_youssfi/config/GlobalParams.dart';
import 'package:flutter_youssfi/provider/counterState.dart';
import 'package:provider/provider.dart';

class LayoutProvider extends StatelessWidget {
  const LayoutProvider({super.key});
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(home: SimpleText());
    // return MaterialApp(home: Mycenter());
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Counterstate())],
      child: MaterialApp(
        title: 'flutter youssfi',
        debugShowCheckedModeBanner: false, //pour enlever la barriere :debug
        routes: Globalparams.routes,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          // primarySwatch: Colors.red,
        ),
        initialRoute: '/',
        // home: HomePage(),
      ),
    );
  }
}
