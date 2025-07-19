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
  void dispose() {
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("L O G I N")),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: BlocProvider(
        create: (_) => _loginBloc,
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: BlocListener<LoginBloc, LoginState>(
            listenWhen: (previous, current) =>
                current.loginStatus != previous.loginStatus,
            listener: (context, state) {
              if (state.loginStatus == LoginStatus.error) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(
                        state.message.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.red,
                      showCloseIcon: true,
                    ),
                  );
              }
              if (state.loginStatus == LoginStatus.loading) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(
                        "Loading",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.blueAccent,
                      showCloseIcon: true,
                    ),
                  );
              }
              if (state.loginStatus == LoginStatus.success) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(
                        "Login Successful",
                        style: TextStyle(color: Colors.white),
                      ),
                      showCloseIcon: true,
                      backgroundColor: Colors.blueAccent,
                    ),
                  );
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        context.read<LoginBloc>().add(
                          EmailEvents(email: value.toString()),
                        );
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
                          PasswordEvents(password: value.toString()),
                        );
                      },
                      onFieldSubmitted: (value) {},
                    );
                  },
                ),
                SizedBox(height: 10),
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (current, previous) =>
                      current.loginStatus != previous.loginStatus,
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.blueAccent,
                        ),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {
                        context.read<LoginBloc>().add(LoginApiEvents());
                        Future.delayed(Duration(seconds: 3));
                        emailFocus.unfocus();
                        passwordFocus.unfocus();
                      },
                      child: Center(child: Text("L o g i n")),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
