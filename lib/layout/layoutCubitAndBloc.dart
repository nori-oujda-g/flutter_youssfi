// pour générer il suffit d'ecrire : st
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_youssfi/config/GlobalParams.dart';
import 'package:flutter_youssfi/mvc/bloc/contact_bloc.dart';
import 'package:flutter_youssfi/mvc/bloc/contact_event.dart';
import 'package:flutter_youssfi/provider/counterBlocState.dart';
import 'package:flutter_youssfi/provider/counterCubitState.dart';

class LayoutCubitAndBloc extends StatelessWidget {
  const LayoutCubitAndBloc({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubitState>(
          create: (context) => CounterCubitState(0),
        ),
        BlocProvider<CounterBlocState>(create: (context) => CounterBlocState()),
        BlocProvider(
          create:
              (context) => ContactBuilderBloc()..add(FetchBuilderContacts()),
          // child: PostView(),
        ),
        // BlocProvider<ContactsBloc>(
        //   create: (context) => ContactsBloc(ContactsRepository()),
        // ),
      ],
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
