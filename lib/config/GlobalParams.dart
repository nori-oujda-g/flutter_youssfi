import 'package:flutter/material.dart';

class Globalparams {
  static List<Map<String, dynamic>> menu = [
    {'title': 'home', 'icon': Icons.home, 'route': '/'},
    {'title': 'Meteo', 'icon': Icons.access_alarm, 'route': '/meteo'},
    {'title': 'Galery', 'icon': Icons.image, 'route': '/galery'},
    {'title': 'Counter', 'icon': Icons.countertops, 'route': '/counter'},
    {'title': 'Users', 'icon': Icons.supervised_user_circle, 'route': '/users'},
    {'title': 'Searsh', 'icon': Icons.search_sharp, 'route': '/searsh'},
  ];
}
