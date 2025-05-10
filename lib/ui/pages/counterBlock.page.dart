import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_youssfi/provider/counterBlocState.dart';

class CounterBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('COUNTER BLOC'),
      ),
      body: BlocBuilder<CounterBlocState, int>(
        builder:
            (context, state) => Center(
              child: Text(
                'page counter \ncounter value =$state',
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
              context.read<CounterBlocState>().add(CounterEvent.INCREMENT);
            },
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              context.read<CounterBlocState>().add(CounterEvent.DECREMENT);
            },
          ),
        ],
      ),
    );
  }
}
