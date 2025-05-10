import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User extends StatefulWidget {
  String? login;
  String? avatar_url;
  Color? defaultColor;
  User({this.login, this.defaultColor, this.avatar_url});
  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  dynamic dataRepos;
  @override
  void initState() {
    super.initState();
    loadRepos();
  }

  void loadRepos() async {
    Uri url = Uri.parse('https://api.github.com/users/${widget.login}/repos');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        dataRepos = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'show user : ${widget.login} ',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: widget.defaultColor,
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.avatar_url as String),
            radius: 20,
            backgroundColor: widget.defaultColor,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.avatar_url as String),
              radius: 50,
              backgroundColor: widget.defaultColor,
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder:
                  (context, index) =>
                      ListTile(title: Text(dataRepos[index]['name'])),
              separatorBuilder:
                  (context, index) =>
                      Divider(height: 2, color: widget.defaultColor),
              itemCount: this.dataRepos == null ? 0 : this.dataRepos.length,
            ),
          ),
        ],
      ),
    );
  }
}
