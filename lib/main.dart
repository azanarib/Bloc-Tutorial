import 'package:bloc_tutorial/Bloc/Counter/counter_bloc.dart';
import 'package:bloc_tutorial/UI/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: MaterialApp(title: "Counter App", home: CounterApp()),
    );
  }
}
