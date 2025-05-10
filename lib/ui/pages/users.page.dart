import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_youssfi/ui/pages/user.page.dart';
import 'package:http/http.dart' as http;

class Users extends StatefulWidget {
  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  TextEditingController myState = new TextEditingController();

  String query = '';
  Color defaultColor = Colors.deepOrange;
  dynamic data = null; //pour stocker les données json .
  bool onVisible = true;
  int currentPage = 0;
  int totalPages = 0;
  int pageSize = 20;
  ScrollController scrollController = new ScrollController();
  List<dynamic> users = [];
  OutlineInputBorder getBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: color),
      borderRadius: BorderRadius.circular(10),
    );
  }

  SizedBox _sp() {
    return SizedBox(width: 20);
  }

  void _searsh(String query) {
    Uri url = Uri.parse(
      'https://api.github.com/search/users?q=$query&per_page=$pageSize&page=$currentPage',
    );
    http
        .get(url)
        .then((response) {
          setState(() {
            print('qurey = $query');
            print('url = $url');
            print('response =  ${response.body}');
            this.data = json.decode(response.body);
            this.users.addAll(data['items']);
            if (this.data['total_count'] % this.pageSize == 0)
              this.totalPages = this.data['total_count'] ~/ this.pageSize;
            else
              this.totalPages =
                  (this.data['total_count'] ~/ this.pageSize).floor() + 1;
            // ~/ pour division euclidienne des entiers
            // floor() : on prend seulement la partie entiere du nombre
          });
        })
        .catchError((error) {
          print('erreur!!!!!!!!!!!!!!!!!!!');
        });
  }

  @override
  void initState() {
    super.initState();
    this.scrollController.addListener(() {
      if (this.scrollController.position.pixels ==
          this.scrollController.position.maxScrollExtent) {
        setState(() {
          if (this.currentPage < this.totalPages - 1) {
            ++this.currentPage;
            this._searsh(this.query);
          }
        });
      }
    });
  }

  // @override
  // void dispose() {
  //   scrollController.dispose(); // Libérer le ScrollController
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('USERS: $query => $currentPage / $totalPages'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(3),
                    padding: EdgeInsets.all(3),
                    child: TextFormField(
                      controller: myState,
                      obscureText: !this.onVisible,
                      onChanged: (value) {
                        setState(() {
                          this.query = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'searsh user',
                        labelStyle: TextStyle(color: defaultColor),
                        contentPadding: EdgeInsets.only(left: 20),
                        border: getBorder(defaultColor),
                        focusedBorder: getBorder(Colors.red),
                        enabledBorder: getBorder(Colors.blue),
                        suffixIcon: IconButton(
                          icon: Icon(
                            !this.onVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              this.onVisible = !this.onVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      users = [];
                      currentPage = 0;
                      this.query = myState.text;
                      this._searsh(this.query);
                      print(this.query);
                    });
                  },
                  icon: Icon(Icons.search),
                ),
              ],
            ),
            Expanded(
              // child: ListView.builder(
              child: ListView.separated(
                separatorBuilder:
                    (context, index) => Divider(height: 2, color: defaultColor),
                controller: scrollController,
                itemCount: users.length,
                itemBuilder:
                    (context, index) => MouseRegion(
                      cursor: SystemMouseCursors.text,
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                    users[index]['avatar_url'],
                                  ),
                                ),
                                _sp(),
                                Text(users[index]['login']),
                              ],
                            ),

                            CircleAvatar(
                              backgroundColor: defaultColor,
                              foregroundColor: Colors.white,
                              child: Text(users[index]['score'].toString()),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => User(
                                    login: users[index]['login'],
                                    defaultColor: defaultColor,
                                    avatar_url: users[index]['avatar_url'],
                                  ),
                            ),
                          );
                        },
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
