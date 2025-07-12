import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool value;
  final double slider;

  const SwitchState({this.value = false, this.slider = 0.5});

  @override
  List<Object?> get props => [value, slider];

  SwitchState copyWith( {bool? isSwitched, double? slider1}) {
    return SwitchState(value: isSwitched ?? value, slider: slider1 ?? slider);
  }
}
