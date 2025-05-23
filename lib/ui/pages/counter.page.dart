import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;

  // const Counter({super.key});
  @override
  Widget build(BuildContext context) {
    print('build simple counter .....');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('COUNTER'),
      ),
      body: Center(
        child: Text(
          'page counter \ncounter value = $counter ',
          style: TextStyle(fontSize: 25, color: Colors.indigo),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                counter++;
              });
            },
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              setState(() {
                counter--;
              });
            },
          ),
        ],
      ),
    );
  }
}
