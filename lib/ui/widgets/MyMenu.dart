// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_youssfi/config/GlobalParams.dart';

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/canario1.png'),
                    radius: 50,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/sivianos1.png'),
                    radius: 50,
                  ),
                ],
              ),
            ),
          ),
          ...(Globalparams.menu).map(
            (item) => ColumnMenu(
              title: item['title'],
              icon: item['icon'],
              route: item['route'],
            ),
          ),
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
  final String route;
  const ColumnMenu({
    super.key,
    required this.title,
    required this.icon,
    required this.route,
  });
  void getPage(BuildContext context, String page) {
    Navigator.of(context).pop();
    Navigator.pushNamed(context, page);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title, style: TextStyle(fontSize: 22)),
          leading: Icon(icon, color: Colors.deepPurpleAccent),
          trailing: Icon(Icons.arrow_right, color: Colors.deepPurpleAccent),
          onTap: () => {getPage(context, route)},
        ),
        MyDivider(),
      ],
    );
  }
}
