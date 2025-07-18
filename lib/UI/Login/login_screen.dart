import 'package:bloc_tutorial/Bloc/Login/login_bloc.dart';
import 'package:bloc_tutorial/Bloc/Login/login_event.dart';
import 'package:bloc_tutorial/Bloc/Login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("L O G I N"))),
      body: BlocProvider(
        create: (context) => _loginBloc,
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Column(
            children: [
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (current, previous) =>
                    current.email != previous.email,
                builder: (context, state) {
                  return TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    focusNode: emailFocus,
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      context.read<LoginBloc>().add(EmailEvents(value));
                    },
                    onFieldSubmitted: (value) {},
                  );
                },
              ),
              SizedBox(height: 10),
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (current, previous) =>
                    current.password != previous.password,
                builder: (context, state) {
                  return TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    focusNode: passwordFocus,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      context.read<LoginBloc>().add(
                        PasswordEvents(password: value),
                      );
                    },
                    onFieldSubmitted: (value) {},
                  );
                },
              ),
              SizedBox(height: 10),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state.loginStatus == LoginStatus.error) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(content: Text(state.message.toString())),
                      );
                  }
                  if (state.loginStatus == LoginStatus.loading) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(content: Text("Loading")));
                    if (state.loginStatus == LoginStatus.success) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(content: Text("Login Successful")),
                        );
                    }
                  }
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (current, previous) => false,
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(LoginApiEvents());
                      },
                      child: Center(child: Text("L o g i n")),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
