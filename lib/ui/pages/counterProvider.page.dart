import 'package:flutter/material.dart';
import 'package:flutter_youssfi/provider/counterState.dart';
import 'package:provider/provider.dart';

class CounterProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counterstate cState = Provider.of<Counterstate>(context, listen: false);
    print('build counter provider .....');
    // listen: false  : c.a.d dans ce cas on n'est pas besion de faire une subcribe .
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('COUNTER PROVIDER'),
      ),
      body: Consumer<Counterstate>(
        builder:
            (context, counterstate, child) => Center(
              child: Text(
                'page counter \ncounter value = ${counterstate.counter}',
                style: TextStyle(fontSize: 25, color: Colors.indigo),
              ),
            ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              cState.increment();
            },
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              cState.deccrement();
            },
          ),
        ],
      ),
    );
  }
}
