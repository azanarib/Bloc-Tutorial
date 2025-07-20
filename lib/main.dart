import 'package:bloc_tutorial/Bloc/Image_picker_bloc/bloc.dart';
import 'package:bloc_tutorial/Bloc/Post/post_bloc.dart';
import 'package:bloc_tutorial/Bloc/Switch/switch_bloc.dart';
import 'package:bloc_tutorial/Bloc/Todo/todo_bloc.dart';
import 'package:bloc_tutorial/UI/Favourite_App_Screen/favourite_screen.dart';
import 'package:bloc_tutorial/Utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (_) => TodoAppBloc()),
        BlocProvider(create: (_) => PostBloc()),
      ],
      child: MaterialApp(
        title: "Post Api",
        home: FavouriteAppScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
