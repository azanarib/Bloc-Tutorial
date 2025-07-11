import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/Bloc/Counter/counter_events.dart';
import 'package:bloc_tutorial/Bloc/Counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvents, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
  }

  void _increment(IncrementCounter events, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decrement(DecrementCounter events, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
