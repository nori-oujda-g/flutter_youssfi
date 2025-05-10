import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_youssfi/provider/counterCubitState.dart';

class CounterCubit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('COUNTER CUBIT'),
      ),
      body: BlocBuilder<CounterCubitState, int>(
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
              context.read<CounterCubitState>().increment();
            },
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              context.read<CounterCubitState>().decrement();
            },
          ),
        ],
      ),
    );
  }
}
