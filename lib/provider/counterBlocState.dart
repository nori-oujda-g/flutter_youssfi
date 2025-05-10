import 'package:bloc/bloc.dart';

enum CounterEvent { INCREMENT, DECREMENT }

class CounterBlocState extends Bloc<CounterEvent, int> {
  // CounterBlocState() : super(0);
  // @override
  // Stream<int> mapEventToState(CounterEvent event) async* {
  //   if (event == CounterEvent.INCREMENT) {
  //     yield state + 1;
  //   } else if (event == CounterEvent.DECREMENT) {
  //     yield state - 1;
  //   }
  // }

  CounterBlocState() : super(0) {
    on<CounterEvent>((event, emit) {
      if (event == CounterEvent.INCREMENT) {
        emit(state + 1);
      } else if (event == CounterEvent.DECREMENT) {
        emit(state - 1);
      }
    });
  }
}
