// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyMenu extends StatelessWidget {
  const MyMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.blue, Colors.yellow],
              ),
            ),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/canario1.png'),
                radius: 50,
              ),
            ),
          ),
          ColumnMenu(title: 'home', icon: Icons.home),
          MyDivider(),
          ColumnMenu(title: 'meteo', icon: Icons.access_alarm),
          MyDivider(),
          ColumnMenu(title: 'galery', icon: Icons.image),
          MyDivider(),
          ColumnMenu(title: 'counter', icon: Icons.countertops),
        ],
      ),
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});
  @override
  Widget build(BuildContext context) {
    return Divider(height: 2, color: Colors.deepPurpleAccent);
  }
}

class ColumnMenu extends StatelessWidget {
  final String title;
  final IconData icon;
  const ColumnMenu({super.key, required this.title, required this.icon});
  void getPage(BuildContext context, String page) {
    Navigator.of(context).pop();
    Navigator.pushNamed(context, page);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: TextStyle(fontSize: 22)),
      leading: Icon(icon, color: Colors.deepPurpleAccent),
      trailing: Icon(Icons.arrow_right, color: Colors.deepPurpleAccent),
      onTap: () => {getPage(context, '/$title')},
    );
  }
}
