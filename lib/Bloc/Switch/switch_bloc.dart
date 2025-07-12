import 'package:bloc_tutorial/Bloc/Switch/switch_event.dart';
import 'package:bloc_tutorial/Bloc/Switch/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<EnableNotification>(_enableNotification);
    on<SliderEvents>(_slider);
  }

  void _enableNotification(
    EnableNotification events,
    Emitter<SwitchState> emit,
  ) {
    emit(state.copyWith(isSwitched: !state.value));
  }

  void _slider(SliderEvents events, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider1: events.slider));
  }
}
