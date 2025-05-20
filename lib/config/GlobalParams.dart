import 'package:flutter/material.dart';
import 'package:flutter_youssfi/mvc/view/contacts/contact_builder_view.dart';
import 'package:flutter_youssfi/ui/pages/HomePage.page.dart';
import 'package:flutter_youssfi/ui/pages/counter.page.dart';
import 'package:flutter_youssfi/ui/pages/counterBlock.page.dart';
import 'package:flutter_youssfi/ui/pages/counterCubit.page.dart';
import 'package:flutter_youssfi/ui/pages/counterProvider.page.dart';
import 'package:flutter_youssfi/ui/pages/galery.page.dart';
import 'package:flutter_youssfi/ui/pages/meteo.page.dart';
import 'package:flutter_youssfi/ui/pages/searsh.page.dart';
import 'package:flutter_youssfi/ui/pages/users.page.dart';

class Globalparams {
  static List<Map<String, dynamic>> menu = [
    {'title': 'home', 'icon': Icons.home, 'route': '/'},
    {'title': 'Meteo', 'icon': Icons.access_alarm, 'route': '/meteo'},
    {'title': 'Galery', 'icon': Icons.image, 'route': '/galery'},
    {'title': 'Counter', 'icon': Icons.countertops, 'route': '/counter'},
    {
      'title': 'Counter Provider',
      'icon': Icons.countertops_rounded,
      'route': '/counterProvider',
    },
    {
      'title': 'Counter Cubit',
      'icon': Icons.countertops_sharp,
      'route': '/counterCubit',
    },
    {
      'title': 'Counter Bloc',
      'icon': Icons.countertops_outlined,
      'route': '/counterBloc',
    },
    {'title': 'Users', 'icon': Icons.supervised_user_circle, 'route': '/users'},
    {'title': 'Searsh', 'icon': Icons.search_sharp, 'route': '/searsh'},
    {
      'title': 'Contacts mvc',
      'icon': Icons.contact_page,
      'route': '/contactsPage',
    },
  ];
  static Map<String, Widget Function(dynamic)> routes = {
    '/': (context) => HomePage(),
    '/meteo': (context) => Meteo(),
    '/galery': (context) => Galery(),
    '/counter': (context) => Counter(),
    '/counterProvider': (context) => CounterProvider(),
    '/counterCubit': (context) => CounterCubit(),
    '/counterBloc': (context) => CounterBloc(),
    '/users': (context) => Users(),
    '/searsh': (context) => Searsh(),
    // '/contactsPage': (context) => ContactsPage(),
    '/contactsPage': (context) => ContactBuilderView(),
  };
}
