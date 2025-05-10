import 'package:bloc/bloc.dart';

class CounterCubitState extends Cubit<int> {
  CounterCubitState(int state) : super(state);
  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }
}
