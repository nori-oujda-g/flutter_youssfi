import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  TextEditingController myState = new TextEditingController();

  String query = '';
  bool onVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('USERS: $query'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  //Expanded ocupe toute la page
                  child: Container(
                    padding: EdgeInsets.all(3),
                    child: TextFormField(
                      controller: myState,
                      decoration: InputDecoration(
                        labelText: 'Enter text',
                        labelStyle: TextStyle(color: Colors.orange),
                        contentPadding: EdgeInsets.only(left: 20),
                        icon: Icon(Icons.logout),
                        suffixIcon: Icon(Icons.visibility),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.deepOrange,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.yellow,
                          ), // Bordure au focus
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.deepOrange,
                          ), // Bordure par défaut
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      this.query = myState.text;
                      print(this.query);
                    });
                  },
                  icon: Icon(Icons.search),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(3),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    this.query = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Enter text onchange',
                  border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(3),
              child: TextFormField(
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    this.query = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'password',
                  border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(3),
              child: TextFormField(
                obscureText: this.onVisible,
                onChanged: (value) {
                  setState(() {
                    this.query = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'password 2',
                  border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
                  suffixIcon: IconButton(
                    icon: Icon(
                      this.onVisible ? Icons.visibility : Icons.visibility_off,
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
          ],
        ),
      ),
    );
  }
}
